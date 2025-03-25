/*
 This file is auto-generated
 */

import Foundation

/// Adds a rating of the given item made by the given user.
public struct AddRating: Request {
    public typealias Response = StringResponseBinding

    /// User who submitted the rating
    public let userId: String

    /// Rated item
    public let itemId: String

    /// Rating rescaled to interval [-1.0,1.0], where -1.0 means the worst rating possible, 0.0 means neutral, and 1.0 means absolutely positive rating. For example, in the case of 5-star evaluations, rating = (numStars-3)/2 formula may be used for the conversion.
    public let rating: Double

    /// UTC timestamp of the rating as ISO8601-1 pattern or UTC epoch time. The default value is the current time.
    public var timestamp: Date? = nil

    /// Sets whether the given user/item should be created if not present in the database.
    public var cascadeCreate: Bool? = true

    /// If this rating is based on a recommendation request, `recommId` is the id of the clicked recommendation.
    public var recommId: String? = nil

    /// A dictionary of additional data for the interaction.
    public var additionalData: JSONDictionary? = nil

    /// Initializes AddRating request
    /// - Parameters:
    ///   - userId: User who submitted the rating
    ///   - itemId: Rated item
    ///   - timestamp: UTC timestamp of the rating as ISO8601-1 pattern or UTC epoch time. The default value is the current time.
    ///   - rating: Rating rescaled to interval [-1.0,1.0], where -1.0 means the worst rating possible, 0.0 means neutral, and 1.0 means absolutely positive rating. For example, in the case of 5-star evaluations, rating = (numStars-3)/2 formula may be used for the conversion.
    ///   - cascadeCreate: Sets whether the given user/item should be created if not present in the database.
    ///   - recommId: If this rating is based on a recommendation request, `recommId` is the id of the clicked recommendation.
    ///   - additionalData: A dictionary of additional data for the interaction.
    public init(userId: String, itemId: String, rating: Double, timestamp: Date? = nil, cascadeCreate: Bool? = true, recommId: String? = nil, additionalData: JSONDictionary? = nil) {
        self.userId = userId
        self.itemId = itemId
        self.timestamp = timestamp
        self.rating = rating
        self.cascadeCreate = cascadeCreate
        self.recommId = recommId
        self.additionalData = additionalData
    }

    /// The API path for the request
    public var path: String { "/ratings/" }

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
            "rating": rating,
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
