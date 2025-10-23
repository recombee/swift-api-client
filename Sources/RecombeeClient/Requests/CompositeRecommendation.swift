/*
 This file is auto-generated
 */

import Foundation

/// Composite Recommendation returns both a *source entity* (e.g., an Item or [Item Segment](https://docs.recombee.com/segmentations.html)) and a list of related recommendations in a single response.
/// It is ideal for use cases such as personalized homepage sections (*Articles from <category>*), *Because You Watched <movie>*, or *Artists Related to Your Favorite Artist <artist>*.
/// See detailed **examples and configuration guidance** in the [Composite Scenarios documentation](https://docs.recombee.com/scenarios#composite-recommendations).
/// **Structure**
/// The endpoint operates in two stages:
/// 1. Recommends the *source* (e.g., an Item Segment or item) to the user.
/// 2. Recommends *results* (items or Item Segments) related to that *source*.
/// For example, *Articles from <category>* can be decomposed into:
///   - [Recommend Item Segments To User](https://docs.recombee.com/api#recommend-item-segments-to-user) to find the category.
///   - [Recommend Items To Item Segment](https://docs.recombee.com/api#recommend-items-to-item-segment) to recommend articles from that category.
/// Since the first step uses [Recommend Item Segments To User](https://docs.recombee.com/api#recommend-items-to-user), you must include the `userId` parameter in the *Composite Recommendation* request.
/// Each *Composite Recommendation* counts as a single recommendation API request for billing.
/// **Stage-specific Parameters**
/// Additional parameters can be supplied via [sourceSettings](https://docs.recombee.com/api#composite-recommendation-param-sourceSettings) and [resultSettings](https://docs.recombee.com/api#composite-recommendation-param-resultSettings).
/// In the example above:
///   - `sourceSettings` may include any parameter valid for [Recommend Item Segments To User](https://docs.recombee.com/api#recommend-items-to-user) (e.g., `filter`, `booster`).
///   - `resultSettings` may include any parameter valid for [Recommend Items To Item Segment](https://docs.recombee.com/api#recommend-items-to-item-segment).
/// See [this example](https://docs.recombee.com/api#composite-recommendation-example-setting-parameters-for-individual-stages) for more details.
public struct CompositeRecommendation: Request {
    public typealias Response = CompositeRecommendationResponse

    /// Scenario defines a particular application of recommendations. It can be, for example, "homepage", "cart", or "emailing".
    /// You can set various settings to the [scenario](https://docs.recombee.com/scenarios) in the [Admin UI](https://admin.recombee.com). You can also see the performance of each scenario in the Admin UI separately, so you can check how well each application performs.
    /// The AI that optimizes models to get the best results may optimize different scenarios separately or even use different models in each of the scenarios.

    public let scenario: String

    /// Number of items to be recommended (N for the top-N recommendation).

    public let count: Int

    /// ID of the item for which the recommendations are to be generated.

    public var itemId: String? = nil

    /// ID of the user for which the recommendations are to be generated.

    public var userId: String? = nil

    /// Logic specifies the particular behavior of the recommendation models. You can pick tailored logic for your domain and use case.
    /// See [this section](https://docs.recombee.com/recommendation_logics) for a list of available logics and other details.
    /// The difference between `logic` and `scenario` is that `logic` specifies mainly behavior, while `scenario` specifies the place where recommendations are shown to the users.
    /// Logic can also be set to a [scenario](https://docs.recombee.com/scenarios) in the [Admin UI](https://admin.recombee.com).

    public var logic: Logic? = nil

    /// ID of the segment from `contextSegmentationId` for which the recommendations are to be generated.

    public var segmentId: String? = nil

    /// If the entity for the source recommendation does not exist in the database, returns a list of non-personalized recommendations and creates the user in the database. This allows, for example, rotations in the following recommendations for that entity, as the entity will be already known to the system.

    public var cascadeCreate: Bool? = true

    /// Parameters applied for recommending the *Source* stage. The accepted parameters correspond with the recommendation sub-endpoint used to recommend the *Source*.

    public var sourceSettings: CompositeRecommendationStageParameters? = nil

    /// Parameters applied for recommending the *Result* stage. The accepted parameters correspond with the recommendation sub-endpoint used to recommend the *Result*.

    public var resultSettings: CompositeRecommendationStageParameters? = nil

    /// Dictionary of custom options.

    public var expertSettings: JSONDictionary? = nil

    /// Initializes CompositeRecommendation request
    /// - Parameters:
    ///   - scenario: Scenario defines a particular application of recommendations. It can be, for example, "homepage", "cart", or "emailing".
    /// You can set various settings to the [scenario](https://docs.recombee.com/scenarios) in the [Admin UI](https://admin.recombee.com). You can also see the performance of each scenario in the Admin UI separately, so you can check how well each application performs.
    /// The AI that optimizes models to get the best results may optimize different scenarios separately or even use different models in each of the scenarios.
    ///   - count: Number of items to be recommended (N for the top-N recommendation).
    ///   - itemId: ID of the item for which the recommendations are to be generated.
    ///   - userId: ID of the user for which the recommendations are to be generated.
    ///   - logic: Logic specifies the particular behavior of the recommendation models. You can pick tailored logic for your domain and use case.
    /// See [this section](https://docs.recombee.com/recommendation_logics) for a list of available logics and other details.
    /// The difference between `logic` and `scenario` is that `logic` specifies mainly behavior, while `scenario` specifies the place where recommendations are shown to the users.
    /// Logic can also be set to a [scenario](https://docs.recombee.com/scenarios) in the [Admin UI](https://admin.recombee.com).
    ///   - segmentId: ID of the segment from `contextSegmentationId` for which the recommendations are to be generated.
    ///   - cascadeCreate: If the entity for the source recommendation does not exist in the database, returns a list of non-personalized recommendations and creates the user in the database. This allows, for example, rotations in the following recommendations for that entity, as the entity will be already known to the system.
    ///   - sourceSettings: Parameters applied for recommending the *Source* stage. The accepted parameters correspond with the recommendation sub-endpoint used to recommend the *Source*.
    ///   - resultSettings: Parameters applied for recommending the *Result* stage. The accepted parameters correspond with the recommendation sub-endpoint used to recommend the *Result*.
    ///   - expertSettings: Dictionary of custom options.

    public init(scenario: String, count: Int, itemId: String? = nil, userId: String? = nil, logic: Logic? = nil, segmentId: String? = nil, cascadeCreate: Bool? = true, sourceSettings: CompositeRecommendationStageParameters? = nil, resultSettings: CompositeRecommendationStageParameters? = nil, expertSettings: JSONDictionary? = nil) {
        self.scenario = scenario
        self.count = count
        self.itemId = itemId
        self.userId = userId
        self.logic = logic
        self.segmentId = segmentId
        self.cascadeCreate = cascadeCreate
        self.sourceSettings = sourceSettings
        self.resultSettings = resultSettings
        self.expertSettings = expertSettings
    }

    /// The API path for the request
    public var path: String { "/recomms/composite/" }

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
            "scenario": scenario,
            "count": count,
        ]

        if let itemId = itemId {
            body["itemId"] = itemId
        }

        if let userId = userId {
            body["userId"] = userId
        }

        if let logic = logic {
            body["logic"] = logic
        }

        if let segmentId = segmentId {
            body["segmentId"] = segmentId
        }

        if let cascadeCreate = cascadeCreate {
            body["cascadeCreate"] = cascadeCreate
        }

        if let sourceSettings = sourceSettings {
            body["sourceSettings"] = sourceSettings
        }

        if let resultSettings = resultSettings {
            body["resultSettings"] = resultSettings
        }

        if let expertSettings = expertSettings {
            body["expertSettings"] = expertSettings
        }

        return body
    }
}
