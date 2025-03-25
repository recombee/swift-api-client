import Foundation

/// A protocol representing a single API request to Recombee.
///
/// Conforming types define the endpoint path, HTTP method, parameters, and expected response type.
/// This protocol is used internally by the SDK to standardize request construction and dispatching.
public protocol Request {
    /// The expected response type returned by the API.
    associatedtype Response: RecombeeBinding

    /// The API path for this request (e.g., `/recommendations/users/`).
    var path: String { get }

    /// The HTTP method used for the request (e.g., GET, POST).
    var method: HTTPMethod { get }

    /// Query parameters to be included in the request URL.
    var queryParameters: [String: Any]? { get }

    /// Body parameters to be sent in the request payload.
    var bodyParameters: [String: Any]? { get }

    /// The timeout interval for the request, in seconds.
    var timeout: TimeInterval { get set }

    /// Whether to enforce HTTPS for this request, regardless of client configuration.
    var ensureHttps: Bool { get }

    /// Returns a dictionary representation of the request, combining path, method, and parameters.
    func toDictionary() -> [String: Any]
}

public extension Request {
    /// Default implementation of `toDictionary()`, combining path, method, and parameters.
    ///
    /// Used for sending the requests in Batch.
    func toDictionary() -> [String: Any] {
        var dict: [String: Any] = [
            "path": path,
            "method": method.rawValue,
        ]

        // Merge query and body parameters into a single `params` field
        var params: [String: Any] = [:]

        if let queryParams = queryParameters {
            params.merge(queryParams) { _, new in new }
        }

        if let bodyParams = bodyParameters {
            params.merge(bodyParams) { _, new in new }
        }

        dict["params"] = params
        return dict
    }
}
