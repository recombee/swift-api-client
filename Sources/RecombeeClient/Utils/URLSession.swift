import Foundation

public extension URLSession {
    /// Default URLSession for Recombee client with ephemeral configuration
    static let recombeeSession: URLSession = {
        var configuration = URLSessionConfiguration.ephemeral
        return URLSession(configuration: configuration)
    }()
}
