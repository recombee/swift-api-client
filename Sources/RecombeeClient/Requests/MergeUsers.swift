/*
 This file is auto-generated
 */

import Foundation

/// Merges interactions (purchases, ratings, bookmarks, detail views ...) of two different users under a single user ID. This is especially useful for online e-commerce applications working with anonymous users identified by unique tokens such as the session ID. In such applications, it may often happen that a user owns a persistent account, yet accesses the system anonymously while, e.g., putting items into a shopping cart. At some point in time, such as when the user wishes to confirm the purchase, (s)he logs into the system using his/her username and password. The interactions made under anonymous session ID then become connected with the persistent account, and merging these two becomes desirable.
/// Merging happens between two users referred to as the *target* and the *source*. After the merge, all the interactions of the source user are attributed to the target user, and the source user is **deleted**.
/// By default, the *Merge Users* request is only available from server-side integrations for security reasons, to prevent potential abuse.
/// If you need to call this request from a client-side environment (such as a web or mobile app), please contact our support and request access to enable this feature for your database.
public struct MergeUsers: Request {
    public typealias Response = StringResponseBinding

    /// ID of the target user.
    public let targetUserId: String

    /// ID of the source user.
    public let sourceUserId: String

    /// Sets whether the user *targetUserId* should be created if not present in the database.
    public var cascadeCreate: Bool? = true

    /// Initializes MergeUsers request
    /// - Parameters:
    ///   - targetUserId: ID of the target user.
    ///   - sourceUserId: ID of the source user.
    ///   - cascadeCreate: Sets whether the user *targetUserId* should be created if not present in the database.
    public init(targetUserId: String, sourceUserId: String, cascadeCreate: Bool? = true) {
        self.targetUserId = targetUserId
        self.sourceUserId = sourceUserId
        self.cascadeCreate = cascadeCreate
    }

    /// The API path for the request
    public var path: String { "/users/\(targetUserId)/merge/\(sourceUserId)" }

    /// The HTTP method used to send the request
    public var method: HTTPMethod { .PUT }

    /// Timeout interval in seconds.
    public var timeout: TimeInterval = 10.0

    /// Whether to enforce HTTPS for this request.
    public var ensureHttps: Bool { false }

    /// Query parameters to be included in the URL
    public var queryParameters: [String: Any]? {
        return [
            "cascadeCreate": cascadeCreate,
        ]
    }

    /// The body of the request as a dictionary
    public var bodyParameters: [String: Any]? {
        var body: [String: Any] = [:]

        return body
    }
}
