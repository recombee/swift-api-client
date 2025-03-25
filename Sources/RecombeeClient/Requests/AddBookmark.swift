/*
 This file is auto-generated
 */

import Foundation

/// Adds a bookmark of the given item made by the given user.
public struct AddBookmark: Request {
    public typealias Response = StringResponseBinding

    /// User who bookmarked the item
    public let userId: String

    /// Bookmarked item
    public let itemId: String

    /// UTC timestamp of the bookmark as ISO8601-1 pattern or UTC epoch time. The default value is the current time.
    public var timestamp: Date? = nil

    /// Sets whether the given user/item should be created if not present in the database.
    public var cascadeCreate: Bool? = true

    /// If this bookmark is based on a recommendation request, `recommId` is the id of the clicked recommendation.
    public var recommId: String? = nil

    /// A dictionary of additional data for the interaction.
    public var additionalData: JSONDictionary? = nil

    /// Initializes AddBookmark request
    /// - Parameters:
    ///   - userId: User who bookmarked the item
    ///   - itemId: Bookmarked item
    ///   - timestamp: UTC timestamp of the bookmark as ISO8601-1 pattern or UTC epoch time. The default value is the current time.
    ///   - cascadeCreate: Sets whether the given user/item should be created if not present in the database.
    ///   - recommId: If this bookmark is based on a recommendation request, `recommId` is the id of the clicked recommendation.
    ///   - additionalData: A dictionary of additional data for the interaction.
    public init(userId: String, itemId: String, timestamp: Date? = nil, cascadeCreate: Bool? = true, recommId: String? = nil, additionalData: JSONDictionary? = nil) {
        self.userId = userId
        self.itemId = itemId
        self.timestamp = timestamp
        self.cascadeCreate = cascadeCreate
        self.recommId = recommId
        self.additionalData = additionalData
    }

    /// The API path for the request
    public var path: String { "/bookmarks/" }

    /// The HTTP method used to send the request
    public var method: HTTPMethod { .POST }

    /// Timeout interval in seconds.
    public var timeout: TimeInterval = 3.0

    /// Whether to enforce HTTPS for this request.
    public var ensureHttps: Bool { false }

    /// Query parameters to be included in the URL
    public var queryParameters: [String: Any]? {
        return [:]
    }

    /// The body of the request as a dictionary
    public var bodyParameters: [String: Any]? {
        var body: [String: Any] = [
            "userId": userId,
            "itemId": itemId,
        ]

        if let timestamp = timestamp {
            body["timestamp"] = ISO8601DateFormatter().string(from: timestamp)
        }

        if let cascadeCreate = cascadeCreate {
            body["cascadeCreate"] = cascadeCreate
        }

        if let recommId = recommId {
            body["recommId"] = recommId
        }

        if let additionalData = additionalData {
            body["additionalData"] = additionalData
        }

        return body
    }
}
