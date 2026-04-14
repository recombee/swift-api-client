/*
 This file is auto-generated
 */

import Foundation

/// Returns Item segments that shall be shown to a user as next recommendations when the user e.g. scrolls the page down (*infinite scroll*) or goes to the next page.
/// It accepts `recommId` of a base recommendation request (e.g., request from the first page) and the number of segments that shall be returned (`count`).
/// The base request can be one of:
///   - [Recommend Item Segments to Item](https://docs.recombee.com/api#recommend-item-segments-to-item)
///   - [Recommend Item Segments to User](https://docs.recombee.com/api#recommend-item-segments-to-user)
///   - [Recommend Item Segments to Item Segment](https://docs.recombee.com/api#recommend-item-segments-to-item-segment)
///   - [Search Item Segments](https://docs.recombee.com/api#search-item-segments)
/// All the other parameters are inherited from the base request.
/// *Recommend next Item segments* can be called many times for a single `recommId` and each call returns different (previously not recommended) segments.
/// The number of *Recommend next Item segments* calls performed so far is returned in the `numberNextRecommsCalls` field.
/// *Recommend next Item segments* can be requested up to 30 minutes after the base request or a previous *Recommend next Item segments* call.
/// For billing purposes, each call to *Recommend next Item segments* is counted as a separate recommendation request.
public struct RecommendNextItemSegments: Request {
    public typealias Response = RecommendationResponse

    /// ID of the base recommendation request for which next recommendations should be returned
    public let recommId: String

    /// Number of item segments to be recommended

    public let count: Int

    /// Initializes RecommendNextItemSegments request
    /// - Parameters:
    ///   - recommId: ID of the base recommendation request for which next recommendations should be returned
    ///   - count: Number of item segments to be recommended

    public init(recommId: String, count: Int) {
        self.recommId = recommId
        self.count = count
    }

    /// The API path for the request
    public var path: String { "/recomms/next/item-segments/\(recommId)" }

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
