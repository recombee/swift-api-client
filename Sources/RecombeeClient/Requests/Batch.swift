import Foundation

/// A request that encapsulates multiple requests in a single batch.
public struct Batch: Request {
    public typealias Response = BatchResponseWrapper

    /// The list of requests to be executed in the batch.
    public let requests: [any Request]

    /// Whether to return distinct recommendations across all batched requests (default is false).
    public var distinctRecomms: Bool? = nil

    public var path: String { "/batch/" }
    public var method: HTTPMethod { .POST }
    public var queryParameters: [String: Any]? { nil }

    /// Serializes the requests into a format the API expects.
    public var bodyParameters: [String: Any]? {
        var body: [String: Any] = [
            "requests": requests.map { $0.toDictionary() },
        ]

        if let distinctRecomms = distinctRecomms {
            body["distinctRecomms"] = distinctRecomms
        }

        return body
    }

    public var timeout: TimeInterval = 30.0
    public var ensureHttps: Bool { true }

    /// Initializes a batch request.
    /// - Parameters:
    ///   - requests: The list of requests to include in the batch.
    ///   - distinctRecomms: Whether to return distinct recommendations across all batched requests.
    public init(requests: [any Request], distinctRecomms: Bool? = nil) {
        self.requests = requests
        self.distinctRecomms = distinctRecomms
    }

    public func toDictionary() -> [String: Any] {
        var dict: [String: Any] = [
            "requests": requests.map { $0.toDictionary() },
        ]

        if let distinctRecomms = distinctRecomms {
            dict["distinctRecomms"] = distinctRecomms
        }

        return dict
    }
}
