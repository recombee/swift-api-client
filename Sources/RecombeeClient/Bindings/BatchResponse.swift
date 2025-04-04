@preconcurrency import AnyCodable
import Foundation

/// A type-erased wrapper for `RecombeeBinding` objects.
public struct AnyRecombeeBinding: RecombeeBinding {
    public typealias CodingKeys = NoCodingKeys

    private enum Value: Sendable {
        case dictionary([String: AnyCodable])
        case string(String)
    }

    private let value: Value

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        // Try decoding as a dictionary
        if let dictionary = try? container.decode([String: AnyCodable].self) {
            value = .dictionary(dictionary)
        }
        // Try decoding as a string
        else if let string = try? container.decode(String.self) {
            value = .string(string)
        }
        // Handle unsupported types
        else {
            throw DecodingError.typeMismatch(
                Any.self,
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Unsupported type for AnyRecombeeBinding"
                )
            )
        }
    }

    public func decode<T: RecombeeBinding>(as _: T.Type) throws -> T {
        // Handle JSON objects
        switch value {
        case .dictionary(let dictionary):
            // Map to JSON-compatible `[String: Any]`
            let jsonCompatible = dictionary.mapValues { $0.value }
            let jsonData = try JSONSerialization.data(withJSONObject: jsonCompatible)
            return try JSONDecoder().decode(T.self, from: jsonData)

        case.string(let string):
            // Handle single string values for `StringResponseBinding`
            if T.self == StringResponseBinding.self {
                return StringResponseBinding(response: string) as! T
            }
        }

        // Unsupported value
        throw DecodingError.typeMismatch(
            T.self,
            DecodingError.Context(
                codingPath: [],
                debugDescription: "Value is neither a valid JSON object nor a supported type: \(value)"
            )
        )
    }

    public enum NoCodingKeys: CodingKey {}
}

public enum NoCodingKeys: Swift.CodingKey {}

/// Represents the response for a single request within a batch.
public struct BatchResponse<ResponseType: RecombeeBinding>: Decodable, Sendable {
    /// The HTTP status code returned for this individual request
    public let statusCode: Int

    private let _response: ResponseType?
    private let errorMessage: String?

    enum CodingKeys: String, CodingKey {
        case statusCode = "code"
        case response = "json"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        // Decode the HTTP status code
        statusCode = try container.decode(Int.self, forKey: .statusCode)

        // Attempt to decode the response field, handling errors
        do {
            _response = try container.decodeIfPresent(ResponseType.self, forKey: .response)
        } catch {
            print("Failed to decode response for status code \(statusCode): \(error.localizedDescription)")
            _response = nil
        }

        // Extract error message from within `json` if available
        if let responseContainer = try? container.nestedContainer(keyedBy: ErrorCodingKeys.self, forKey: .response),
           let extractedError = try? responseContainer.decode(String.self, forKey: .error)
        {
            errorMessage = extractedError
        } else {
            errorMessage = nil
        }
    }

    /// Indicates whether the response has a successful status code (2xx).
    public var isSuccessful: Bool {
        return (200 ... 299).contains(statusCode)
    }

    /// Accesses the response or throws a `responseError` if the request was unsuccessful.
    public var response: ResponseType? {
        get throws {
            guard isSuccessful else {
                throw ClientError.responseError(
                    request: nil,
                    statusCode: statusCode,
                    message: errorMessage ?? "API request failed with status code \(statusCode)"
                )
            }
            return _response
        }
    }

    /// Defines keys for extracting `error` from within `json`.
    private enum ErrorCodingKeys: String, CodingKey {
        case error
    }
}

/// A wrapper for batch responses.
public struct BatchResponseWrapper: RecombeeBinding {
    public typealias CodingKeys = NoCodingKeys // Use a placeholder if no specific keys are needed
    public enum NoCodingKeys: CodingKey {} // Dummy coding keys
}
