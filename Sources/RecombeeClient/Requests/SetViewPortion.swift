/*
 This file is auto-generated
 */

import Foundation

/// Sets viewed portion of an item (for example a video or article) by a user (at a session).
/// If you send a new request with the same (`userId`, `itemId`, `sessionId`), the portion gets updated.
public struct SetViewPortion: Request {
    public typealias Response = StringResponseBinding

    /// User who viewed a portion of the item
    public let userId: String

    /// Viewed item
    public let itemId: String

    /// Viewed portion of the item (number between 0.0 (viewed nothing) and 1.0 (viewed full item) ). It should be the actual viewed part of the item, no matter the seeking. For example, if the user seeked immediately to half of the item and then viewed 10% of the item, the `portion` should still be `0.1`.
    public let portion: Double

    /// ID of the session in which the user viewed the item. Default is `null` (`None`, `nil`, `NULL` etc., depending on the language).
    public var sessionId: String? = nil

    /// UTC timestamp of the rating as ISO8601-1 pattern or UTC epoch time. The default value is the current time.
    public var timestamp: Date? = nil

    /// Sets whether the given user/item should be created if not present in the database.
    public var cascadeCreate: Bool? = true

    /// If this view portion is based on a recommendation request, `recommId` is the id of the clicked recommendation.
    public var recommId: String? = nil

    /// A dictionary of additional data for the interaction.
    public var additionalData: JSONDictionary? = nil

    /// Initializes SetViewPortion request
    /// - Parameters:
    ///   - userId: User who viewed a portion of the item
    ///   - itemId: Viewed item
    ///   - portion: Viewed portion of the item (number between 0.0 (viewed nothing) and 1.0 (viewed full item) ). It should be the actual viewed part of the item, no matter the seeking. For example, if the user seeked immediately to half of the item and then viewed 10% of the item, the `portion` should still be `0.1`.
    ///   - sessionId: ID of the session in which the user viewed the item. Default is `null` (`None`, `nil`, `NULL` etc., depending on the language).
    ///   - timestamp: UTC timestamp of the rating as ISO8601-1 pattern or UTC epoch time. The default value is the current time.
    ///   - cascadeCreate: Sets whether the given user/item should be created if not present in the database.
    ///   - recommId: If this view portion is based on a recommendation request, `recommId` is the id of the clicked recommendation.
    ///   - additionalData: A dictionary of additional data for the interaction.
    public init(userId: String, itemId: String, portion: Double, sessionId: String? = nil, timestamp: Date? = nil, cascadeCreate: Bool? = true, recommId: String? = nil, additionalData: JSONDictionary? = nil) {
        self.userId = userId
        self.itemId = itemId
        self.portion = portion
        self.sessionId = sessionId
        self.timestamp = timestamp
        self.cascadeCreate = cascadeCreate
        self.recommId = recommId
        self.additionalData = additionalData
    }

    /// The API path for the request
    public var path: String { "/viewportions/" }

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
            "portion": portion,
        ]

        if let sessionId = sessionId {
            body["sessionId"] = sessionId
        }

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
