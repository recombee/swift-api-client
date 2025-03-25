/*
 This file is auto-generated
 */

import Foundation

/// Full-text personalized search. The results are based on the provided `searchQuery` and also on the user's past interactions (purchases, ratings, etc.) with the items (items more suitable for the user are preferred in the results).
/// All the string and set item properties are indexed by the search engine.
/// This endpoint should be used in a search box on your website/app. It can be called multiple times as the user is typing the query in order to get the most viable suggestions based on the current state of the query, or once after submitting the whole query.
/// The returned items are sorted by relevance (the first item being the most relevant).
/// Besides the recommended items, also a unique `recommId` is returned in the response. It can be used to:
/// - Let Recombee know that this search was successful (e.g., user clicked one of the recommended items). See [Reported metrics](https://docs.recombee.com/admin_ui.html#reported-metrics).
/// - Get subsequent search results when the user scrolls down or goes to the next page. See [Recommend Next Items](https://docs.recombee.com/api.html#recommend-next-items).
/// It is also possible to use POST HTTP method (for example in the case of a very long ReQL filter) - query parameters then become body parameters.
public struct SearchItems: Request {
    public typealias Response = SearchResponse

    /// ID of the user for whom personalized search will be performed.
    public let userId: String

    /// Search query provided by the user. It is used for the full-text search.
    public let searchQuery: String

    /// Number of items to be returned (N for the top-N results).
    public let count: Int

    /// Scenario defines a particular search field in your user interface.
    /// You can set various settings to the [scenario](https://docs.recombee.com/scenarios.html) in the [Admin UI](https://admin.recombee.com). You can also see the performance of each scenario in the Admin UI separately, so you can check how well each field performs.
    /// The AI that optimizes models to get the best results may optimize different scenarios separately, or even use different models in each of the scenarios.

    public var scenario: String? = nil

    /// If the user does not exist in the database, returns a list of non-personalized search results and creates the user in the database. This allows, for example, rotations in the following recommendations for that user, as the user will be already known to the system.
    public var cascadeCreate: Bool? = true

    /// With `returnProperties=true`, property values of the recommended items are returned along with their IDs in a JSON dictionary. The acquired property values can be used to easily display the recommended items to the user.
    /// Example response:
    /// ```json
    ///   {
    ///     "recommId": "ce52ada4-e4d9-4885-943c-407db2dee837",
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
    ///     "recommId": "a86ee8d5-cd8e-46d1-886c-8b3771d0520b",
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

    /// Boolean-returning [ReQL](https://docs.recombee.com/reql.html) expression, which allows you to filter recommended items based on the values of their attributes.
    /// Filters can also be assigned to a [scenario](https://docs.recombee.com/scenarios.html) in the [Admin UI](https://admin.recombee.com).

    public var filter: String? = nil

    /// Number-returning [ReQL](https://docs.recombee.com/reql.html) expression, which allows you to boost the recommendation rate of some items based on the values of their attributes.
    /// Boosters can also be assigned to a [scenario](https://docs.recombee.com/scenarios.html) in the [Admin UI](https://admin.recombee.com).

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

    /// Initializes SearchItems request
    /// - Parameters:
    ///   - userId: ID of the user for whom personalized search will be performed.
    ///   - searchQuery: Search query provided by the user. It is used for the full-text search.
    ///   - count: Number of items to be returned (N for the top-N results).
    ///   - scenario: Scenario defines a particular search field in your user interface.
    /// You can set various settings to the [scenario](https://docs.recombee.com/scenarios.html) in the [Admin UI](https://admin.recombee.com). You can also see the performance of each scenario in the Admin UI separately, so you can check how well each field performs.
    /// The AI that optimizes models to get the best results may optimize different scenarios separately, or even use different models in each of the scenarios.
    ///   - cascadeCreate: If the user does not exist in the database, returns a list of non-personalized search results and creates the user in the database. This allows, for example, rotations in the following recommendations for that user, as the user will be already known to the system.
    ///   - returnProperties: With `returnProperties=true`, property values of the recommended items are returned along with their IDs in a JSON dictionary. The acquired property values can be used to easily display the recommended items to the user.
    /// Example response:
    /// ```json
    ///   {
    ///     "recommId": "ce52ada4-e4d9-4885-943c-407db2dee837",
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
    ///     "recommId": "a86ee8d5-cd8e-46d1-886c-8b3771d0520b",
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
    ///   - filter: Boolean-returning [ReQL](https://docs.recombee.com/reql.html) expression, which allows you to filter recommended items based on the values of their attributes.
    /// Filters can also be assigned to a [scenario](https://docs.recombee.com/scenarios.html) in the [Admin UI](https://admin.recombee.com).
    ///   - booster: Number-returning [ReQL](https://docs.recombee.com/reql.html) expression, which allows you to boost the recommendation rate of some items based on the values of their attributes.
    /// Boosters can also be assigned to a [scenario](https://docs.recombee.com/scenarios.html) in the [Admin UI](https://admin.recombee.com).
    ///   - logic: Logic specifies the particular behavior of the recommendation models. You can pick tailored logic for your domain and use case.
    /// See [this section](https://docs.recombee.com/recommendation_logics.html) for a list of available logics and other details.
    /// The difference between `logic` and `scenario` is that `logic` specifies mainly behavior, while `scenario` specifies the place where recommendations are shown to the users.
    /// Logic can also be set to a [scenario](https://docs.recombee.com/scenarios.html) in the [Admin UI](https://admin.recombee.com).
    ///   - expertSettings: Dictionary of custom options.
    ///   - returnAbGroup: If there is a custom AB-testing running, return the name of the group to which the request belongs.

    public init(userId: String, searchQuery: String, count: Int, scenario: String? = nil, cascadeCreate: Bool? = true, returnProperties: Bool? = nil, includedProperties: [String]? = nil, filter: String? = nil, booster: String? = nil, logic: Logic? = nil, expertSettings: JSONDictionary? = nil, returnAbGroup: Bool? = nil) {
        self.userId = userId
        self.searchQuery = searchQuery
        self.count = count
        self.scenario = scenario
        self.cascadeCreate = cascadeCreate
        self.returnProperties = returnProperties
        self.includedProperties = includedProperties
        self.filter = filter
        self.booster = booster
        self.logic = logic
        self.expertSettings = expertSettings
        self.returnAbGroup = returnAbGroup
    }

    /// The API path for the request
    public var path: String { "/search/users/\(userId)/items/" }

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
            "searchQuery": searchQuery,
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

        if let expertSettings = expertSettings {
            body["expertSettings"] = expertSettings
        }

        if let returnAbGroup = returnAbGroup {
            body["returnAbGroup"] = returnAbGroup
        }

        return body
    }
}
