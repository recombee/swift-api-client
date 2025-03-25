import Foundation

/// An error type representing various failure scenarios encountered when communicating with the Recombee API.
public enum ClientError: LocalizedError {
    /// The request exceeded the configured timeout duration.
    ///
    /// - Parameters:
    ///   - request: The request that timed out.
    ///   - seconds: The timeout interval in seconds.
    case timeout(request: (any Request)?, seconds: TimeInterval)

    /// The API responded with a non-success HTTP status code (e.g. 400, 500).
    ///
    /// - Parameters:
    ///   - request: The request that caused the error.
    ///   - statusCode: The HTTP status code returned by the API.
    ///   - message: An optional message extracted from the API error response.
    case responseError(request: (any Request)?, statusCode: Int, message: String)

    /// A network-related error occurred (e.g. connection failure).
    ///
    /// - Parameters:
    ///   - request: The request that caused the error.
    ///   - underlyingError: The underlying `Error` from the networking layer.
    case networkError(request: (any Request)?, underlyingError: Error)

    /// Failed to decode the response returned by the API.
    ///
    /// - Parameters:
    ///   - request: The request that caused the error.
    ///   - underlyingError: The error thrown during decoding.
    case decodingError(request: (any Request)?, underlyingError: Error)

    /// An unspecified or unrecognized error occurred.
    ///
    /// - Parameter request: The request that caused the error.
    case unknownError(request: (any Request)?)

    /// A user-readable description of the error.
    public var errorDescription: String? {
        switch self {
        case let .timeout(_, seconds):
            return "The request timed out after \(Int(seconds)) seconds."
        case let .responseError(_, statusCode, message):
            return """
            The API returned a non-success status code
            - Status Code: \(statusCode)
            - Message: \(message)
            """
        case let .networkError(_, error):
            return "A network error occurred: \(error.localizedDescription)"
        case let .decodingError(_, error):
            return "Failed to decode the response: \(error.localizedDescription)"
        case .unknownError:
            return "An unknown error occurred."
        }
    }

    /// A short explanation of why the operation failed.
    public var failureReason: String? {
        switch self {
        case .timeout:
            return "The API did not respond within the timeout interval."
        case let .responseError(_, statusCode, _):
            return "The API returned a non-success status code: \(statusCode)."
        case .networkError:
            return "A network-related issue occurred."
        case .decodingError:
            return "The data could not be processed."
        case .unknownError:
            return "The error is unidentifiable."
        }
    }

    /// The request that caused this error, if available.
    ///
    /// Useful for debugging batch responses or identifying which specific request failed.
    public var request: (any Request)? {
        switch self {
        case let .timeout(request, _),
             let .responseError(request, _, _),
             let .networkError(request, _),
             let .decodingError(request, _),
             let .unknownError(request):
            return request
        }
    }
}
