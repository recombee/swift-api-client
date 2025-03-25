import AnyCodable
import CommonCrypto
import Foundation

/// A client for communicating with the Recombee API.
///
/// Use this class to send interaction events and fetch recommendations and search results.
public class RecombeeClient {
    private let baseUrl: String
    private let databaseId: String
    private let publicToken: String
    private let useHttpsByDefault: Bool
    private let port: Int?
    private let session: URLSession

    /// Initializes a new `RecombeeClient` instance.
    ///
    /// - Parameters:
    ///   - databaseId: Your Recombee database ID.
    ///   - publicToken: The public token for authenticating requests.
    ///   - useHttpsByDefault: Whether to use HTTPS for requests (default: `true`).
    ///   - region: Region of your Recombee database
    ///   - baseUri: Custom base URI, provided by the Recombee support (used instead of `region`)
    ///   - port: Optional custom port
    ///   - session: URLSession to be used by the RecombeeClient (default: `.recombeeSession`)
    public init(
        databaseId: String,
        publicToken: String,
        useHttpsByDefault: Bool = true,
        region: Region? = nil,
        baseUri: String? = nil,
        port: Int? = nil,
        session: URLSession = .recombeeSession
    ) {
        self.databaseId = databaseId
        self.publicToken = publicToken
        self.useHttpsByDefault = useHttpsByDefault
        self.port = port
        self.session = session
        baseUrl = RecombeeClient.getHostUri(baseUri: baseUri, region: region)
    }

    /// Sends a request to the Recombee API and decodes the response.
    ///
    /// - Parameter request: The typed request to send.
    /// - Returns: The decoded response of the associated type.
    /// - Throws: `ClientError` if the request fails.
    public func send<T: Request>(_ request: T) async throws -> T.Response {
        let data = try await performRequest(request: request)
        do {
            return try JSONDecoder().decode(T.Response.self, from: data)
        } catch {
            throw ClientError.decodingError(request: request, underlyingError: error)
        }
    }

    /// Sends a batch of requests to the Recombee API.
    ///
    /// - Parameter batch: The Batch request object.
    /// - Returns: Responses for each individual request in the batch.
    /// - Throws: `ClientError` if the whole Batch request fails.
    public func send(_ batch: Batch) async throws -> [BatchResponse<AnyRecombeeBinding>] {
        let data = try await performRequest(request: batch)
        return try JSONDecoder().decode([BatchResponse<AnyRecombeeBinding>].self, from: data)
    }

    /// Sends a request to the Recombee API in a detached task with default priority.
    ///
    /// This overload is useful for requests where you don't need to process the response.
    /// It uses `Task.detached` with `TaskPriority.utility` and logs errors if they occur.
    ///
    /// - Parameter request: The typed request to send.
    public func sendDetached<T: Request>(_ request: T) {
        Task.detached(priority: .utility) { [weak self] in
            guard let self = self else { return }
            do {
                _ = try await self.send(request)
            } catch {
                print("Error sending request: \(error.localizedDescription)")
            }
        }
    }

    // MARK: - Internal Helpers

    /// Performs the actual network request and returns the response data.
    private func performRequest<T: Request>(request: T) async throws -> Data {
        let protocolType = (useHttpsByDefault || request.ensureHttps) ? "https" : "http"
        let signedUrl = "\(protocolType)://\(baseUrl)" + signRequestUrl(path: request.path, queryParams: request.queryParameters)

        guard let requestUrl = URL(string: signedUrl) else {
            throw ClientError.unknownError(request: request)
        }

        var urlRequest = URLRequest(url: requestUrl)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.timeoutInterval = request.timeout
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")

        if let body = request.bodyParameters {
            urlRequest.httpBody = try JSONEncoder().encode(AnyCodable(body))
        }

        let (data, httpResponse) = try await executeRequest(urlRequest)

        guard (200 ... 299).contains(httpResponse.statusCode) else {
            let message = String(data: data, encoding: .utf8) ?? "No message provided"
            throw ClientError.responseError(request: request, statusCode: httpResponse.statusCode, message: message)
        }

        return data
    }

    /// Executes a URL request using `URLSession`.
    private func executeRequest(_ urlRequest: URLRequest) async throws -> (Data, HTTPURLResponse) {
        let (data, response) = try await session.data(for: urlRequest)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw ClientError.unknownError(request: nil)
        }

        return (data, httpResponse)
    }

    /// Gets API URI based on the `region` / `baseUri`
    private static func getHostUri(baseUri: String?, region: Region?) -> String {
        if let envHostUri = ProcessInfo.processInfo.environment["RAPI_URI"] {
            return envHostUri
        }

        if let region = region {
            if baseUri != nil {
                fatalError("baseUri and region cannot be specified at the same time")
            }
            return region.rawValue
        }

        return baseUri ?? "client-rapi-eu-west.recombee.com"
    }

    /// Signs a request path with a timestamp and HMAC signature.
    private func signRequestUrl(path: String, queryParams: [String: Any]?) -> String {
        let timestamp = Int(Date().timeIntervalSince1970)
        var urlComponents = URLComponents()
        urlComponents.path = "/\(databaseId)\(path)"

        var queryItems = convertQueryParams(queryParams)?.map { URLQueryItem(name: $0.key, value: $0.value) } ?? []
        queryItems.append(URLQueryItem(name: "frontend_timestamp", value: "\(timestamp)"))
        urlComponents.queryItems = queryItems

        let pathAndQuery = urlComponents.path + (urlComponents.percentEncodedQuery.map { "?\($0)" } ?? "")
        let signature = generateHMACSignature(for: pathAndQuery)
        queryItems.append(URLQueryItem(name: "frontend_sign", value: signature))
        urlComponents.queryItems = queryItems

        return urlComponents.url?.absoluteString ?? path
    }

    /// Converts any values in query parameters to string values.
    private func convertQueryParams(_ queryParams: [String: Any]?) -> [String: String]? {
        return queryParams?.reduce(into: [String: String]()) { result, pair in
            result[pair.key] = "\(pair.value)"
        }
    }

    /// Generates an HMAC signature for the given message using the public token.
    private func generateHMACSignature(for message: String) -> String {
        guard let key = publicToken.data(using: .utf8),
              let messageData = message.data(using: .utf8)
        else {
            fatalError("Invalid key or message encoding")
        }

        var hmac = [UInt8](repeating: 0, count: Int(CC_SHA1_DIGEST_LENGTH))
        messageData.withUnsafeBytes { messageBytes in
            key.withUnsafeBytes { keyBytes in
                CCHmac(CCHmacAlgorithm(kCCHmacAlgSHA1), keyBytes.baseAddress, key.count, messageBytes.baseAddress, messageData.count, &hmac)
            }
        }

        return Data(hmac).map { String(format: "%02hhx", $0) }.joined()
    }
}
