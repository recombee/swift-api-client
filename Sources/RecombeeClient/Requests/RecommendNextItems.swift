/*
 This file is auto-generated
 */

import Foundation

/// Returns items that shall be shown to a user as next recommendations when the user e.g. scrolls the page down (*infinite scroll*) or goes to the next page.
/// It accepts `recommId` of a base recommendation request (e.g., request from the first page) and the number of items that shall be returned (`count`).
/// The base request can be one of:
///   - [Recommend Items to Item](https://docs.recombee.com/api.html#recommend-items-to-item)
///   - [Recommend Items to User](https://docs.recombee.com/api.html#recommend-items-to-user)
///   - [Recommend Items to Item Segment](https://docs.recombee.com/api.html#recommend-items-to-item-segment)
///   - [Search Items](https://docs.recombee.com/api.html#search-items)
/// All the other parameters are inherited from the base request.
/// *Recommend next items* can be called many times for a single `recommId` and each call returns different (previously not recommended) items.
/// The number of *Recommend next items* calls performed so far is returned in the `numberNextRecommsCalls` field.
/// *Recommend next items* can be requested up to 30 minutes after the base request or a previous *Recommend next items* call.
/// For billing purposes, each call to *Recommend next items* is counted as a separate recommendation request.
public struct RecommendNextItems: Request {
    public typealias Response = RecommendationResponse

    /// ID of the base recommendation request for which next recommendations should be returned
    public let recommId: String

    /// Number of items to be recommended

    public let count: Int

    /// Initializes RecommendNextItems request
    /// - Parameters:
    ///   - recommId: ID of the base recommendation request for which next recommendations should be returned
    ///   - count: Number of items to be recommended

    public init(recommId: String, count: Int) {
        self.recommId = recommId
        self.count = count
    }

    /// The API path for the request
    public var path: String { "/recomms/next/items/\(recommId)" }

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
            "count": count,
        ]

        return body
    }
}
