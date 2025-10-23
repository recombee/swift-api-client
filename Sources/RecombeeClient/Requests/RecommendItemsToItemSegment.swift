/*
 This file is auto-generated
 */

import Foundation

/// Recommends Items that are the most relevant to a particular Segment from a context [Segmentation](https://docs.recombee.com/segmentations).
/// Based on the used Segmentation, this endpoint can be used for example for:
/// - Recommending articles related to a particular topic
/// - Recommending songs belonging to a particular genre
/// - Recommending products produced by a particular brand
/// You need to set the used context Segmentation in the Admin UI in the [Scenario settings](https://docs.recombee.com/scenarios) prior to using this endpoint.
/// The returned items are sorted by relevance (the first item being the most relevant).
/// It is also possible to use the POST HTTP method (for example, in the case of a very long ReQL filter) — query parameters then become body parameters.
public struct RecommendItemsToItemSegment: Request {
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

    /// Number of items to be recommended (N for the top-N recommendation).
    public let count: Int

    /// Scenario defines a particular application of recommendations. It can be, for example, "homepage", "cart", or "emailing".
    /// You can set various settings to the [scenario](https://docs.recombee.com/scenarios) in the [Admin UI](https://admin.recombee.com). You can also see the performance of each scenario in the Admin UI separately, so you can check how well each application performs.
    /// The AI that optimizes models to get the best results may optimize different scenarios separately or even use different models in each of the scenarios.

    public var scenario: String? = nil

    /// If a user of the given *targetUserId* doesn't exist in the database, it creates this user and returns some (non-personalized) recommendations. This allows, for example, rotations in the following recommendations for the user of the given *targetUserId*, as the user will be already known to the system.
    public var cascadeCreate: Bool? = true

    /// With `returnProperties=true`, property values of the recommended items are returned along with their IDs in a JSON dictionary. The acquired property values can be used to easily display the recommended items to the user.
    /// Example response:
    /// ```json
    ///   {
    ///     "recommId": "0c6189e7-dc1a-429a-b613-192696309361",
    ///     "recomms":
    ///       [
    ///         {
    ///           "id": "tv-178",
    ///           "values": {
    ///             "description": "4K TV with 3D feature",
    ///             "categories":   ["Electronics", "Televisions"],
    ///             "price": 342,
    ///             "url": "myshop.com/tv-178"
    ///           }
    ///         },
    ///         {
    ///           "id": "mixer-42",
    ///           "values": {
    ///             "description": "Stainless Steel Mixer",
    ///             "categories":   ["Home & Kitchen"],
    ///             "price": 39,
    ///             "url": "myshop.com/mixer-42"
    ///           }
    ///         }
    ///       ],
    ///     "numberNextRecommsCalls": 0
    ///   }
    /// ```

    public var returnProperties: Bool? = nil

    /// Allows specifying which properties should be returned when `returnProperties=true` is set. The properties are given as a comma-separated list.
    /// Example response for `includedProperties=description,price`:
    /// ```json
    ///   {
    ///     "recommId": "6842c725-a79f-4537-a02c-f34d668a3f80",
    ///     "recomms":
    ///       [
    ///         {
    ///           "id": "tv-178",
    ///           "values": {
    ///             "description": "4K TV with 3D feature",
    ///             "price": 342
    ///           }
    ///         },
    ///         {
    ///           "id": "mixer-42",
    ///           "values": {
    ///             "description": "Stainless Steel Mixer",
    ///             "price": 39
    ///           }
    ///         }
    ///       ],
    ///     "numberNextRecommsCalls": 0
    ///   }
    /// ```

    public var includedProperties: [String]? = nil

    /// Boolean-returning [ReQL](https://docs.recombee.com/reql) expression, which allows you to filter recommended items based on the values of their attributes.
    /// Filters can also be assigned to a [scenario](https://docs.recombee.com/scenarios) in the [Admin UI](https://admin.recombee.com).

    public var filter: String? = nil

    /// Number-returning [ReQL](https://docs.recombee.com/reql) expression, which allows you to boost the recommendation rate of some items based on the values of their attributes.
    /// Boosters can also be assigned to a [scenario](https://docs.recombee.com/scenarios) in the [Admin UI](https://admin.recombee.com).

    public var booster: String? = nil

    /// Logic specifies the particular behavior of the recommendation models. You can pick tailored logic for your domain and use case.
    /// See [this section](https://docs.recombee.com/recommendation_logics) for a list of available logics and other details.
    /// The difference between `logic` and `scenario` is that `logic` specifies mainly behavior, while `scenario` specifies the place where recommendations are shown to the users.
    /// Logic can also be set to a [scenario](https://docs.recombee.com/scenarios) in the [Admin UI](https://admin.recombee.com).

    public var logic: Logic? = nil

    /// A dictionary of [ReQL](https://docs.recombee.com/reql) expressions that will be executed for each recommended item.
    /// This can be used to compute additional properties of the recommended items that are not stored in the database.
    /// The keys are the names of the expressions, and the values are the actual ReQL expressions.
    /// Example request:
    /// ```json
    /// {
    ///   "reqlExpressions": {
    ///     "isInUsersCity": "context_user[\"city\"] in 'cities'",
    ///     "distanceToUser": "earth_distance('location', context_user[\"location\"])"
    ///   }
    /// }
    /// ```
    /// Example response:
    /// ```json
    /// {
    ///   "recommId": "ce52ada4-e4d9-4885-943c-407db2dee837",
    ///   "recomms":
    ///     [
    ///       {
    ///         "id": "restaurant-178",
    ///         "reqlEvaluations": {
    ///           "isInUsersCity": true,
    ///           "distanceToUser": 5200.2
    ///         }
    ///       },
    ///       {
    ///         "id": "bar-42",
    ///         "reqlEvaluations": {
    ///           "isInUsersCity": false,
    ///           "distanceToUser": 2516.0
    ///         }
    ///       }
    ///     ],
    ///    "numberNextRecommsCalls": 0
    /// }
    /// ```

    public var reqlExpressions: JSONDictionary? = nil

    /// **Expert option:** If the *targetUserId* is provided:  Specifies the threshold of how relevant must the recommended items be to the user. Possible values one of: "low", "medium", "high". The default value is "low", meaning that the system attempts to recommend a number of items equal to *count* at any cost. If there is not enough data (such as interactions or item properties), this may even lead to bestseller-based recommendations being appended to reach the full *count*. This behavior may be suppressed by using "medium" or "high" values. In such case, the system only recommends items of at least the requested relevance and may return less than *count* items when there is not enough data to fulfill it.

    public var minRelevance: String? = nil

    /// **Expert option:** If the *targetUserId* is provided: If your users browse the system in real-time, it may easily happen that you wish to offer them recommendations multiple times. Here comes the question: how much should the recommendations change? Should they remain the same, or should they rotate? Recombee API allows you to control this per request in a backward fashion. You may penalize an item for being recommended in the near past. For the specific user, `rotationRate=1` means maximal rotation, `rotationRate=0` means absolutely no rotation. You may also use, for example, `rotationRate=0.2` for only slight rotation of recommended items.

    public var rotationRate: Double? = nil

    /// **Expert option:** If the *targetUserId* is provided: Taking *rotationRate* into account, specifies how long it takes for an item to recover from the penalization. For example, `rotationTime=7200.0` means that items recommended less than 2 hours ago are penalized.

    public var rotationTime: Double? = nil

    /// Dictionary of custom options.

    public var expertSettings: JSONDictionary? = nil

    /// If there is a custom AB-testing running, return the name of the group to which the request belongs.

    public var returnAbGroup: Bool? = nil

    /// Initializes RecommendItemsToItemSegment request
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
    ///   - count: Number of items to be recommended (N for the top-N recommendation).
    ///   - scenario: Scenario defines a particular application of recommendations. It can be, for example, "homepage", "cart", or "emailing".
    /// You can set various settings to the [scenario](https://docs.recombee.com/scenarios) in the [Admin UI](https://admin.recombee.com). You can also see the performance of each scenario in the Admin UI separately, so you can check how well each application performs.
    /// The AI that optimizes models to get the best results may optimize different scenarios separately or even use different models in each of the scenarios.
    ///   - cascadeCreate: If a user of the given *targetUserId* doesn't exist in the database, it creates this user and returns some (non-personalized) recommendations. This allows, for example, rotations in the following recommendations for the user of the given *targetUserId*, as the user will be already known to the system.
    ///   - returnProperties: With `returnProperties=true`, property values of the recommended items are returned along with their IDs in a JSON dictionary. The acquired property values can be used to easily display the recommended items to the user.
    /// Example response:
    /// ```json
    ///   {
    ///     "recommId": "0c6189e7-dc1a-429a-b613-192696309361",
    ///     "recomms":
    ///       [
    ///         {
    ///           "id": "tv-178",
    ///           "values": {
    ///             "description": "4K TV with 3D feature",
    ///             "categories":   ["Electronics", "Televisions"],
    ///             "price": 342,
    ///             "url": "myshop.com/tv-178"
    ///           }
    ///         },
    ///         {
    ///           "id": "mixer-42",
    ///           "values": {
    ///             "description": "Stainless Steel Mixer",
    ///             "categories":   ["Home & Kitchen"],
    ///             "price": 39,
    ///             "url": "myshop.com/mixer-42"
    ///           }
    ///         }
    ///       ],
    ///     "numberNextRecommsCalls": 0
    ///   }
    /// ```
    ///   - includedProperties: Allows specifying which properties should be returned when `returnProperties=true` is set. The properties are given as a comma-separated list.
    /// Example response for `includedProperties=description,price`:
    /// ```json
    ///   {
    ///     "recommId": "6842c725-a79f-4537-a02c-f34d668a3f80",
    ///     "recomms":
    ///       [
    ///         {
    ///           "id": "tv-178",
    ///           "values": {
    ///             "description": "4K TV with 3D feature",
    ///             "price": 342
    ///           }
    ///         },
    ///         {
    ///           "id": "mixer-42",
    ///           "values": {
    ///             "description": "Stainless Steel Mixer",
    ///             "price": 39
    ///           }
    ///         }
    ///       ],
    ///     "numberNextRecommsCalls": 0
    ///   }
    /// ```
    ///   - filter: Boolean-returning [ReQL](https://docs.recombee.com/reql) expression, which allows you to filter recommended items based on the values of their attributes.
    /// Filters can also be assigned to a [scenario](https://docs.recombee.com/scenarios) in the [Admin UI](https://admin.recombee.com).
    ///   - booster: Number-returning [ReQL](https://docs.recombee.com/reql) expression, which allows you to boost the recommendation rate of some items based on the values of their attributes.
    /// Boosters can also be assigned to a [scenario](https://docs.recombee.com/scenarios) in the [Admin UI](https://admin.recombee.com).
    ///   - logic: Logic specifies the particular behavior of the recommendation models. You can pick tailored logic for your domain and use case.
    /// See [this section](https://docs.recombee.com/recommendation_logics) for a list of available logics and other details.
    /// The difference between `logic` and `scenario` is that `logic` specifies mainly behavior, while `scenario` specifies the place where recommendations are shown to the users.
    /// Logic can also be set to a [scenario](https://docs.recombee.com/scenarios) in the [Admin UI](https://admin.recombee.com).
    ///   - reqlExpressions: A dictionary of [ReQL](https://docs.recombee.com/reql) expressions that will be executed for each recommended item.
    /// This can be used to compute additional properties of the recommended items that are not stored in the database.
    /// The keys are the names of the expressions, and the values are the actual ReQL expressions.
    /// Example request:
    /// ```json
    /// {
    ///   "reqlExpressions": {
    ///     "isInUsersCity": "context_user[\"city\"] in 'cities'",
    ///     "distanceToUser": "earth_distance('location', context_user[\"location\"])"
    ///   }
    /// }
    /// ```
    /// Example response:
    /// ```json
    /// {
    ///   "recommId": "ce52ada4-e4d9-4885-943c-407db2dee837",
    ///   "recomms":
    ///     [
    ///       {
    ///         "id": "restaurant-178",
    ///         "reqlEvaluations": {
    ///           "isInUsersCity": true,
    ///           "distanceToUser": 5200.2
    ///         }
    ///       },
    ///       {
    ///         "id": "bar-42",
    ///         "reqlEvaluations": {
    ///           "isInUsersCity": false,
    ///           "distanceToUser": 2516.0
    ///         }
    ///       }
    ///     ],
    ///    "numberNextRecommsCalls": 0
    /// }
    /// ```
    ///   - minRelevance: **Expert option:** If the *targetUserId* is provided:  Specifies the threshold of how relevant must the recommended items be to the user. Possible values one of: "low", "medium", "high". The default value is "low", meaning that the system attempts to recommend a number of items equal to *count* at any cost. If there is not enough data (such as interactions or item properties), this may even lead to bestseller-based recommendations being appended to reach the full *count*. This behavior may be suppressed by using "medium" or "high" values. In such case, the system only recommends items of at least the requested relevance and may return less than *count* items when there is not enough data to fulfill it.
    ///   - rotationRate: **Expert option:** If the *targetUserId* is provided: If your users browse the system in real-time, it may easily happen that you wish to offer them recommendations multiple times. Here comes the question: how much should the recommendations change? Should they remain the same, or should they rotate? Recombee API allows you to control this per request in a backward fashion. You may penalize an item for being recommended in the near past. For the specific user, `rotationRate=1` means maximal rotation, `rotationRate=0` means absolutely no rotation. You may also use, for example, `rotationRate=0.2` for only slight rotation of recommended items.
    ///   - rotationTime: **Expert option:** If the *targetUserId* is provided: Taking *rotationRate* into account, specifies how long it takes for an item to recover from the penalization. For example, `rotationTime=7200.0` means that items recommended less than 2 hours ago are penalized.
    ///   - expertSettings: Dictionary of custom options.
    ///   - returnAbGroup: If there is a custom AB-testing running, return the name of the group to which the request belongs.

    public init(contextSegmentId: String, targetUserId: String, count: Int, scenario: String? = nil, cascadeCreate: Bool? = true, returnProperties: Bool? = nil, includedProperties: [String]? = nil, filter: String? = nil, booster: String? = nil, logic: Logic? = nil, reqlExpressions: JSONDictionary? = nil, minRelevance: String? = nil, rotationRate: Double? = nil, rotationTime: Double? = nil, expertSettings: JSONDictionary? = nil, returnAbGroup: Bool? = nil) {
        self.contextSegmentId = contextSegmentId
        self.targetUserId = targetUserId
        self.count = count
        self.scenario = scenario
        self.cascadeCreate = cascadeCreate
        self.returnProperties = returnProperties
        self.includedProperties = includedProperties
        self.filter = filter
        self.booster = booster
        self.logic = logic
        self.reqlExpressions = reqlExpressions
        self.minRelevance = minRelevance
        self.rotationRate = rotationRate
        self.rotationTime = rotationTime
        self.expertSettings = expertSettings
        self.returnAbGroup = returnAbGroup
    }

    /// The API path for the request
    public var path: String { "/recomms/item-segments/items/" }

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

        if let returnProperties = returnProperties {
            body["returnProperties"] = returnProperties
        }

        if let includedProperties = includedProperties {
            body["includedProperties"] = includedProperties
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

        if let reqlExpressions = reqlExpressions {
            body["reqlExpressions"] = reqlExpressions
        }

        if let minRelevance = minRelevance {
            body["minRelevance"] = minRelevance
        }

        if let rotationRate = rotationRate {
            body["rotationRate"] = rotationRate
        }

        if let rotationTime = rotationTime {
            body["rotationTime"] = rotationTime
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
