/*
 This file is auto-generated
 */

import Foundation

/// Adds a detail view of the given item made by the given user.
public struct AddDetailView: Request {
    public typealias Response = StringResponseBinding

    /// User who viewed the item
    public let userId: String

    /// Viewed item
    public let itemId: String

    /// UTC timestamp of the view as ISO8601-1 pattern or UTC epoch time. The default value is the current time.
    public var timestamp: Date? = nil

    /// Duration of the view
    public var duration: Int? = nil

    /// Sets whether the given user/item should be created if not present in the database.
    public var cascadeCreate: Bool? = true

    /// If this detail view is based on a recommendation request, `recommId` is the id of the clicked recommendation.
    public var recommId: String? = nil

    /// A dictionary of additional data for the interaction.
    public var additionalData: JSONDictionary? = nil

    /// Indicates whether the item was automatically presented to the user (e.g., in a swiping feed) or explicitly requested by the user (e.g., by clicking on a link). Defaults to `false`.
    public var autoPresented: Bool? = nil

    /// Initializes AddDetailView request
    /// - Parameters:
    ///   - userId: User who viewed the item
    ///   - itemId: Viewed item
    ///   - timestamp: UTC timestamp of the view as ISO8601-1 pattern or UTC epoch time. The default value is the current time.
    ///   - duration: Duration of the view
    ///   - cascadeCreate: Sets whether the given user/item should be created if not present in the database.
    ///   - recommId: If this detail view is based on a recommendation request, `recommId` is the id of the clicked recommendation.
    ///   - additionalData: A dictionary of additional data for the interaction.
    ///   - autoPresented: Indicates whether the item was automatically presented to the user (e.g., in a swiping feed) or explicitly requested by the user (e.g., by clicking on a link). Defaults to `false`.
    public init(userId: String, itemId: String, timestamp: Date? = nil, duration: Int? = nil, cascadeCreate: Bool? = true, recommId: String? = nil, additionalData: JSONDictionary? = nil, autoPresented: Bool? = nil) {
        self.userId = userId
        self.itemId = itemId
        self.timestamp = timestamp
        self.duration = duration
        self.cascadeCreate = cascadeCreate
        self.recommId = recommId
        self.additionalData = additionalData
        self.autoPresented = autoPresented
    }

    /// The API path for the request
    public var path: String { "/detailviews/" }

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

        if let duration = duration {
            body["duration"] = duration
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

        if let autoPresented = autoPresented {
            body["autoPresented"] = autoPresented
        }

        return body
    }
}
