/*
 This file is auto-generated
 */

/// CompositeRecommendationStageParameters Binding
public struct CompositeRecommendationStageParameters: RecombeeBinding, Encodable {
    public typealias CodingKeys = CompositeRecommendationStageParametersCodingKeys

    /// With `returnProperties=true`, property values of the recommended items are returned along with their IDs in a JSON dictionary. The acquired property values can be used to easily display the recommended items to the user.
    /// Example response with `returnProperties` set in the `resultSettings`:
    /// ```json
    ///     {
    ///       "recommId": "ee94fa8b-efe7-4b35-abc6-2bc3456d66ed",
    ///       "source": {
    ///         "id": "category-sport"
    ///       },
    ///       "recomms": [
    ///         {
    ///           "id": "article-1024",
    ///           "values": {
    ///             "title": "Champions League: Stunning Comeback Secures Final Spot",
    ///             "categories": ["Sport", "Football"],
    ///             "author": "Jane Smith",
    ///             "url": "newsportal.com/articles/champions-league-comeback"
    ///           }
    ///         },
    ///         {
    ///           "id": "article-2031",
    ///           "values": {
    ///             "title": "Top 10 Moments from the Summer Olympics",
    ///             "categories": ["Sport", "Olympics"],
    ///             "author": "Mark Johnson",
    ///             "url": "newsportal.com/articles/olympic-top-moments"
    ///           }
    ///         },
    ///         {
    ///           "id": "article-3042",
    ///           "values": {
    ///             "title": "Rising Stars in Women's Tennis to Watch This Season",
    ///             "categories": ["Sport", "Tennis"],
    ///             "author": "Laura Chen",
    ///             "url": "newsportal.com/articles/womens-tennis-stars"
    ///           }
    ///         }
    ///       ],
    ///       "numberNextRecommsCalls": 0
    ///     }
    /// ```

    public var returnProperties: Bool?

    /// Allows specifying which properties should be returned when `returnProperties=true` is set. The properties are given as a comma-separated list.
    /// Example response for  `returnProperties=true` and `includedProperties=title,url` set in `resultSettings`:
    /// ```json
    ///   {
    ///     "recommId": "ee94fa8b-efe7-4b35-abc6-2bc3456d66ed",
    ///     "source": {
    ///       "id": "category-sport"
    ///     },
    ///     "recomms": [
    ///       {
    ///         "id": "article-1024",
    ///         "values": {
    ///           "title": "Champions League: Stunning Comeback Secures Final Spot",
    ///           "url": "newsportal.com/articles/champions-league-comeback"
    ///         }
    ///       },
    ///       {
    ///         "id": "article-2031",
    ///         "values": {
    ///           "title": "Top 10 Moments from the Summer Olympics",
    ///           "url": "newsportal.com/articles/olympic-top-moments"
    ///         }
    ///       },
    ///       {
    ///         "id": "article-3042",
    ///         "values": {
    ///           "title": "Rising Stars in Women's Tennis to Watch This Season",
    ///           "url": "newsportal.com/articles/womens-tennis-stars"
    ///         }
    ///       }
    ///     ],
    ///     "numberNextRecommsCalls": 0
    ///   }
    /// ```

    public var includedProperties: [String]?

    /// Boolean-returning [ReQL](https://docs.recombee.com/reql) expression, which allows you to filter recommended entities based on the values of their attributes.
    /// Filters can also be assigned to a [scenario](https://docs.recombee.com/scenarios) in the [Admin UI](https://admin.recombee.com).

    public var filter: String?

    /// Number-returning [ReQL](https://docs.recombee.com/reql) expression, which allows you to boost the recommendation rate of some entities based on the values of their attributes.
    /// Boosters can also be assigned to a [scenario](https://docs.recombee.com/scenarios) in the [Admin UI](https://admin.recombee.com).

    public var booster: String?

    /// Logic specifies the particular behavior of the recommendation models. You can pick tailored logic for your domain and use case.
    /// See [this section](https://docs.recombee.com/recommendation_logics) for a list of available logics and other details.
    /// The difference between `logic` and `scenario` is that `logic` specifies mainly behavior, while `scenario` specifies the place where recommendations are shown to the users.
    /// Logic can also be set to a [scenario](https://docs.recombee.com/scenarios) in the [Admin UI](https://admin.recombee.com).

    public var logic: Logic?

    /// Only usable if the stage corresponds to the one of these recommendation endpoints:
    /// - [Recommend Items To User](https://docs.recombee.com/api#recommend-items-to-user)
    /// - [Recommend Items To Item](https://docs.recombee.com/api#recommend-items-to-item)
    /// - [Recommend Items to Item Segment](https://docs.recombee.com/api#recommend-items-to-item-segment)
    /// - [Recommend Users to Item](https://docs.recombee.com/api#recommend-users-to-item)
    /// - [Recommend Users To User](https://docs.recombee.com/api#recommend-users-to-user)
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
    ///   "source": {
    ///     "id": "restaurant-123",
    ///     "reqlEvaluations": {
    ///       "isInUsersCity": true,
    ///       "distanceToUser": 3450.5
    ///     }
    ///   },
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

    public var reqlExpressions: JSONDictionary?

    /// **Expert option:** Only usable if the stage corresponds to the one of these recommendation endpoints:
    /// - [Recommend Items To User](https://docs.recombee.com/api#recommend-items-to-user)
    /// - [Recommend Items To Item](https://docs.recombee.com/api#recommend-items-to-item)
    /// - [Recommend Items to Item Segment](https://docs.recombee.com/api#recommend-items-to-item-segment)
    /// If the *userId* is provided:  Specifies the threshold of how relevant must the recommended items be to the user.
    /// Possible values one of: `"low"`, `"medium"`, `"high"`.
    /// The default value is `"low"`, meaning that the system attempts to recommend a number of items equal to *count* at any cost. If there is not enough data (such as interactions or item properties), this may even lead to bestseller-based recommendations being appended to reach the full *count*.
    /// This behavior may be suppressed by using `"medium"` or `"high"` values. In such case, the system only recommends items of at least the requested relevance and may return less than *count* items when there is not enough data to fulfill it.

    public var minRelevance: String?

    /// **Expert option:** Only usable if the stage corresponds to the one of these recommendation endpoints:
    /// - [Recommend Items To User](https://docs.recombee.com/api#recommend-items-to-user)
    /// - [Recommend Items To Item](https://docs.recombee.com/api#recommend-items-to-item)
    /// - [Recommend Items to Item Segment](https://docs.recombee.com/api#recommend-items-to-item-segment)
    /// - [Recommend Users To User](https://docs.recombee.com/api#recommend-users-to-user)
    /// If the *userId* is provided: If your users browse the system in real-time, it may easily happen that you wish to offer them recommendations multiple times. Here comes the question: how much should the recommendations change? Should they remain the same, or should they rotate? Recombee API allows you to control this per request in a backward fashion.
    /// You may penalize an item for being recommended in the near past. For the specific user, `rotationRate=1` means maximal rotation, `rotationRate=0` means absolutely no rotation. You may also use, for example, `rotationRate=0.2` for only slight rotation of recommended items.

    public var rotationRate: Double?

    /// **Expert option:** Only usable if the stage corresponds to the one of these recommendation endpoints:
    /// - [Recommend Items To User](https://docs.recombee.com/api#recommend-items-to-user)
    /// - [Recommend Items To Item](https://docs.recombee.com/api#recommend-items-to-item)
    /// - [Recommend Items to Item Segment](https://docs.recombee.com/api#recommend-items-to-item-segment)
    /// - [Recommend Users To User](https://docs.recombee.com/api#recommend-users-to-user)
    /// If the *userId* is provided: Taking *rotationRate* into account, specifies how long it takes for an item to recover from the penalization. For example, `rotationTime=7200.0` means that items recommended less than 2 hours ago are penalized.

    public var rotationTime: Double?

    /// Coding keys for decoding/encoding
    public enum CompositeRecommendationStageParametersCodingKeys: String, CodingKey {
        case returnProperties
        case includedProperties
        case filter
        case booster
        case logic
        case reqlExpressions
        case minRelevance
        case rotationRate
        case rotationTime
    }

    /// Initializes CompositeRecommendationStageParameters Binding
    /// - Parameters:
    ///   - returnProperties: With `returnProperties=true`, property values of the recommended items are returned along with their IDs in a JSON dictionary. The acquired property values can be used to easily display the recommended items to the user.
    /// Example response with `returnProperties` set in the `resultSettings`:
    /// ```json
    ///     {
    ///       "recommId": "ee94fa8b-efe7-4b35-abc6-2bc3456d66ed",
    ///       "source": {
    ///         "id": "category-sport"
    ///       },
    ///       "recomms": [
    ///         {
    ///           "id": "article-1024",
    ///           "values": {
    ///             "title": "Champions League: Stunning Comeback Secures Final Spot",
    ///             "categories": ["Sport", "Football"],
    ///             "author": "Jane Smith",
    ///             "url": "newsportal.com/articles/champions-league-comeback"
    ///           }
    ///         },
    ///         {
    ///           "id": "article-2031",
    ///           "values": {
    ///             "title": "Top 10 Moments from the Summer Olympics",
    ///             "categories": ["Sport", "Olympics"],
    ///             "author": "Mark Johnson",
    ///             "url": "newsportal.com/articles/olympic-top-moments"
    ///           }
    ///         },
    ///         {
    ///           "id": "article-3042",
    ///           "values": {
    ///             "title": "Rising Stars in Women's Tennis to Watch This Season",
    ///             "categories": ["Sport", "Tennis"],
    ///             "author": "Laura Chen",
    ///             "url": "newsportal.com/articles/womens-tennis-stars"
    ///           }
    ///         }
    ///       ],
    ///       "numberNextRecommsCalls": 0
    ///     }
    /// ```
    ///   - includedProperties: Allows specifying which properties should be returned when `returnProperties=true` is set. The properties are given as a comma-separated list.
    /// Example response for  `returnProperties=true` and `includedProperties=title,url` set in `resultSettings`:
    /// ```json
    ///   {
    ///     "recommId": "ee94fa8b-efe7-4b35-abc6-2bc3456d66ed",
    ///     "source": {
    ///       "id": "category-sport"
    ///     },
    ///     "recomms": [
    ///       {
    ///         "id": "article-1024",
    ///         "values": {
    ///           "title": "Champions League: Stunning Comeback Secures Final Spot",
    ///           "url": "newsportal.com/articles/champions-league-comeback"
    ///         }
    ///       },
    ///       {
    ///         "id": "article-2031",
    ///         "values": {
    ///           "title": "Top 10 Moments from the Summer Olympics",
    ///           "url": "newsportal.com/articles/olympic-top-moments"
    ///         }
    ///       },
    ///       {
    ///         "id": "article-3042",
    ///         "values": {
    ///           "title": "Rising Stars in Women's Tennis to Watch This Season",
    ///           "url": "newsportal.com/articles/womens-tennis-stars"
    ///         }
    ///       }
    ///     ],
    ///     "numberNextRecommsCalls": 0
    ///   }
    /// ```
    ///   - filter: Boolean-returning [ReQL](https://docs.recombee.com/reql) expression, which allows you to filter recommended entities based on the values of their attributes.
    /// Filters can also be assigned to a [scenario](https://docs.recombee.com/scenarios) in the [Admin UI](https://admin.recombee.com).
    ///   - booster: Number-returning [ReQL](https://docs.recombee.com/reql) expression, which allows you to boost the recommendation rate of some entities based on the values of their attributes.
    /// Boosters can also be assigned to a [scenario](https://docs.recombee.com/scenarios) in the [Admin UI](https://admin.recombee.com).
    ///   - logic: Logic specifies the particular behavior of the recommendation models. You can pick tailored logic for your domain and use case.
    /// See [this section](https://docs.recombee.com/recommendation_logics) for a list of available logics and other details.
    /// The difference between `logic` and `scenario` is that `logic` specifies mainly behavior, while `scenario` specifies the place where recommendations are shown to the users.
    /// Logic can also be set to a [scenario](https://docs.recombee.com/scenarios) in the [Admin UI](https://admin.recombee.com).
    ///   - reqlExpressions: Only usable if the stage corresponds to the one of these recommendation endpoints:
    /// - [Recommend Items To User](https://docs.recombee.com/api#recommend-items-to-user)
    /// - [Recommend Items To Item](https://docs.recombee.com/api#recommend-items-to-item)
    /// - [Recommend Items to Item Segment](https://docs.recombee.com/api#recommend-items-to-item-segment)
    /// - [Recommend Users to Item](https://docs.recombee.com/api#recommend-users-to-item)
    /// - [Recommend Users To User](https://docs.recombee.com/api#recommend-users-to-user)
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
    ///   "source": {
    ///     "id": "restaurant-123",
    ///     "reqlEvaluations": {
    ///       "isInUsersCity": true,
    ///       "distanceToUser": 3450.5
    ///     }
    ///   },
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
    ///   - minRelevance: **Expert option:** Only usable if the stage corresponds to the one of these recommendation endpoints:
    /// - [Recommend Items To User](https://docs.recombee.com/api#recommend-items-to-user)
    /// - [Recommend Items To Item](https://docs.recombee.com/api#recommend-items-to-item)
    /// - [Recommend Items to Item Segment](https://docs.recombee.com/api#recommend-items-to-item-segment)
    /// If the *userId* is provided:  Specifies the threshold of how relevant must the recommended items be to the user.
    /// Possible values one of: `"low"`, `"medium"`, `"high"`.
    /// The default value is `"low"`, meaning that the system attempts to recommend a number of items equal to *count* at any cost. If there is not enough data (such as interactions or item properties), this may even lead to bestseller-based recommendations being appended to reach the full *count*.
    /// This behavior may be suppressed by using `"medium"` or `"high"` values. In such case, the system only recommends items of at least the requested relevance and may return less than *count* items when there is not enough data to fulfill it.
    ///   - rotationRate: **Expert option:** Only usable if the stage corresponds to the one of these recommendation endpoints:
    /// - [Recommend Items To User](https://docs.recombee.com/api#recommend-items-to-user)
    /// - [Recommend Items To Item](https://docs.recombee.com/api#recommend-items-to-item)
    /// - [Recommend Items to Item Segment](https://docs.recombee.com/api#recommend-items-to-item-segment)
    /// - [Recommend Users To User](https://docs.recombee.com/api#recommend-users-to-user)
    /// If the *userId* is provided: If your users browse the system in real-time, it may easily happen that you wish to offer them recommendations multiple times. Here comes the question: how much should the recommendations change? Should they remain the same, or should they rotate? Recombee API allows you to control this per request in a backward fashion.
    /// You may penalize an item for being recommended in the near past. For the specific user, `rotationRate=1` means maximal rotation, `rotationRate=0` means absolutely no rotation. You may also use, for example, `rotationRate=0.2` for only slight rotation of recommended items.
    ///   - rotationTime: **Expert option:** Only usable if the stage corresponds to the one of these recommendation endpoints:
    /// - [Recommend Items To User](https://docs.recombee.com/api#recommend-items-to-user)
    /// - [Recommend Items To Item](https://docs.recombee.com/api#recommend-items-to-item)
    /// - [Recommend Items to Item Segment](https://docs.recombee.com/api#recommend-items-to-item-segment)
    /// - [Recommend Users To User](https://docs.recombee.com/api#recommend-users-to-user)
    /// If the *userId* is provided: Taking *rotationRate* into account, specifies how long it takes for an item to recover from the penalization. For example, `rotationTime=7200.0` means that items recommended less than 2 hours ago are penalized.

    public init(returnProperties: Bool? = nil, includedProperties: [String]? = nil, filter: String? = nil, booster: String? = nil, logic: Logic? = nil, reqlExpressions: JSONDictionary? = nil, minRelevance: String? = nil, rotationRate: Double? = nil, rotationTime: Double? = nil) {
        self.returnProperties = returnProperties
        self.includedProperties = includedProperties
        self.filter = filter
        self.booster = booster
        self.logic = logic
        self.reqlExpressions = reqlExpressions
        self.minRelevance = minRelevance
        self.rotationRate = rotationRate
        self.rotationTime = rotationTime
    }

    /// Initializes a new `CompositeRecommendationStageParameters` from a decoder
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        returnProperties = Self.decodeSimpleField(container, forKey: .returnProperties)
        includedProperties = Self.decodeSimpleField(container, forKey: .includedProperties)
        filter = Self.decodeSimpleField(container, forKey: .filter)
        booster = Self.decodeSimpleField(container, forKey: .booster)
        logic = Self.decodeSimpleField(container, forKey: .logic)
        reqlExpressions = Self.decodeJSONField(container, forKey: .reqlExpressions)
        minRelevance = Self.decodeSimpleField(container, forKey: .minRelevance)
        rotationRate = Self.decodeSimpleField(container, forKey: .rotationRate)
        rotationTime = Self.decodeSimpleField(container, forKey: .rotationTime)
    }
}
