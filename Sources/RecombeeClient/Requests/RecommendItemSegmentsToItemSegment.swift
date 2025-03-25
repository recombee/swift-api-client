/*
 This file is auto-generated
 */

import Foundation

/// Recommends Segments from a result [Segmentation](https://docs.recombee.com/segmentations.html) that are the most relevant to a particular Segment from a context Segmentation.
/// Based on the used Segmentations, this endpoint can be used for example for:
///   - Recommending the related brands to particular brand
///   - Recommending the related brands to particular category
///   - Recommending the related artists to a particular genre (assuming songs are the Items)
/// You need to set the used context and result Segmentation the Admin UI in the [Scenario settings](https://docs.recombee.com/scenarios) prior to using this endpoint.
/// The returned segments are sorted by relevance (first segment being the most relevant).
/// It is also possible to use POST HTTP method (for example in case of very long ReQL filter) - query parameters then become body parameters.
public struct RecommendItemSegmentsToItemSegment: Request {
    public typealias Response = RecommendationResponse

    /// ID of the segment from `contextSegmentationId` for which the recommendations are to be generated.
    public let contextSegmentId: String

    /// ID of the user who will see the recommendations.
    /// Specifying the *targetUserId* is beneficial because:
    /// * It makes the recommendations personalized
    /// * Allows the calculation of Actions and Conversions
    ///   in the graphical user interface,
    ///   as Recombee can pair the user who got recommendations
    ///   and who afterward viewed/purchased an item.
    /// If you insist on not specifying the user, pass `null`
    /// (`None`, `nil`, `NULL` etc., depending on the language) to *targetUserId*.
    /// Do not create some special dummy user for getting recommendations,
    /// as it could mislead the recommendation models,
    /// and result in wrong recommendations.
    /// For anonymous/unregistered users, it is possible to use, for example, their session ID.

    public let targetUserId: String

    /// Number of item segments to be recommended (N for the top-N recommendation).

    public let count: Int

    /// Scenario defines a particular application of recommendations. It can be, for example, "homepage", "cart", or "emailing".
    /// You can set various settings to the [scenario](https://docs.recombee.com/scenarios.html) in the [Admin UI](https://admin.recombee.com). You can also see the performance of each scenario in the Admin UI separately, so you can check how well each application performs.
    /// The AI that optimizes models to get the best results may optimize different scenarios separately or even use different models in each of the scenarios.

    public var scenario: String? = nil

    /// If the user does not exist in the database, returns a list of non-personalized recommendations and creates the user in the database. This allows, for example, rotations in the following recommendations for that user, as the user will be already known to the system.

    public var cascadeCreate: Bool? = true

    /// Boolean-returning [ReQL](https://docs.recombee.com/reql.html) expression which allows you to filter recommended segments based on the `segmentationId`.

    public var filter: String? = nil

    /// Number-returning [ReQL](https://docs.recombee.com/reql.html) expression which allows you to boost recommendation rate of some segments based on the `segmentationId`.

    public var booster: String? = nil

    /// Logic specifies the particular behavior of the recommendation models. You can pick tailored logic for your domain and use case.
    /// See [this section](https://docs.recombee.com/recommendation_logics.html) for a list of available logics and other details.
    /// The difference between `logic` and `scenario` is that `logic` specifies mainly behavior, while `scenario` specifies the place where recommendations are shown to the users.
    /// Logic can also be set to a [scenario](https://docs.recombee.com/scenarios.html) in the [Admin UI](https://admin.recombee.com).

    public var logic: Logic? = nil

    /// Dictionary of custom options.

    public var expertSettings: JSONDictionary? = nil

    /// If there is a custom AB-testing running, return the name of the group to which the request belongs.

    public var returnAbGroup: Bool? = nil

    /// Initializes RecommendItemSegmentsToItemSegment request
    /// - Parameters:
    ///   - contextSegmentId: ID of the segment from `contextSegmentationId` for which the recommendations are to be generated.
    ///   - targetUserId: ID of the user who will see the recommendations.
    /// Specifying the *targetUserId* is beneficial because:
    /// * It makes the recommendations personalized
    /// * Allows the calculation of Actions and Conversions
    ///   in the graphical user interface,
    ///   as Recombee can pair the user who got recommendations
    ///   and who afterward viewed/purchased an item.
    /// If you insist on not specifying the user, pass `null`
    /// (`None`, `nil`, `NULL` etc., depending on the language) to *targetUserId*.
    /// Do not create some special dummy user for getting recommendations,
    /// as it could mislead the recommendation models,
    /// and result in wrong recommendations.
    /// For anonymous/unregistered users, it is possible to use, for example, their session ID.
    ///   - count: Number of item segments to be recommended (N for the top-N recommendation).
    ///   - scenario: Scenario defines a particular application of recommendations. It can be, for example, "homepage", "cart", or "emailing".
    /// You can set various settings to the [scenario](https://docs.recombee.com/scenarios.html) in the [Admin UI](https://admin.recombee.com). You can also see the performance of each scenario in the Admin UI separately, so you can check how well each application performs.
    /// The AI that optimizes models to get the best results may optimize different scenarios separately or even use different models in each of the scenarios.
    ///   - cascadeCreate: If the user does not exist in the database, returns a list of non-personalized recommendations and creates the user in the database. This allows, for example, rotations in the following recommendations for that user, as the user will be already known to the system.
    ///   - filter: Boolean-returning [ReQL](https://docs.recombee.com/reql.html) expression which allows you to filter recommended segments based on the `segmentationId`.
    ///   - booster: Number-returning [ReQL](https://docs.recombee.com/reql.html) expression which allows you to boost recommendation rate of some segments based on the `segmentationId`.
    ///   - logic: Logic specifies the particular behavior of the recommendation models. You can pick tailored logic for your domain and use case.
    /// See [this section](https://docs.recombee.com/recommendation_logics.html) for a list of available logics and other details.
    /// The difference between `logic` and `scenario` is that `logic` specifies mainly behavior, while `scenario` specifies the place where recommendations are shown to the users.
    /// Logic can also be set to a [scenario](https://docs.recombee.com/scenarios.html) in the [Admin UI](https://admin.recombee.com).
    ///   - expertSettings: Dictionary of custom options.
    ///   - returnAbGroup: If there is a custom AB-testing running, return the name of the group to which the request belongs.

    public init(contextSegmentId: String, targetUserId: String, count: Int, scenario: String? = nil, cascadeCreate: Bool? = true, filter: String? = nil, booster: String? = nil, logic: Logic? = nil, expertSettings: JSONDictionary? = nil, returnAbGroup: Bool? = nil) {
        self.contextSegmentId = contextSegmentId
        self.targetUserId = targetUserId
        self.count = count
        self.scenario = scenario
        self.cascadeCreate = cascadeCreate
        self.filter = filter
        self.booster = booster
        self.logic = logic
        self.expertSettings = expertSettings
        self.returnAbGroup = returnAbGroup
    }

    /// The API path for the request
    public var path: String { "/recomms/item-segments/item-segments/" }

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
            "contextSegmentId": contextSegmentId,
            "targetUserId": targetUserId,
            "count": count,
        ]

        if let scenario = scenario {
            body["scenario"] = scenario
        }

        if let cascadeCreate = cascadeCreate {
            body["cascadeCreate"] = cascadeCreate
        }

        if let filter = filter {
            body["filter"] = filter
        }

        if let booster = booster {
            body["booster"] = booster
        }

        if let logic = logic {
            body["logic"] = logic
        }

        if let expertSettings = expertSettings {
            body["expertSettings"] = expertSettings
        }

        if let returnAbGroup = returnAbGroup {
            body["returnAbGroup"] = returnAbGroup
        }

        return body
    }
}
