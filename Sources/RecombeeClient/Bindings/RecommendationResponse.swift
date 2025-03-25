/*
 This file is auto-generated
 */

/// RecommendationResponse Binding
public struct RecommendationResponse: RecombeeBinding, Encodable {
    public typealias CodingKeys = RecommendationResponseCodingKeys

    /// Id of the recommendation request
    public let recommId: String

    /// Obtained recommendations
    public let recomms: [Recommendation]

    /// How many times *Recommend Next Items* have been called for this `recommId`
    public var numberNextRecommsCalls: Int?

    /// Name of AB-testing group to which the request belongs if there is a custom AB-testing running.
    public var abGroup: String?

    /// Coding keys for decoding/encoding
    public enum RecommendationResponseCodingKeys: String, CodingKey {
        case recommId
        case recomms
        case numberNextRecommsCalls
        case abGroup
    }

    /// Initializes RecommendationResponse Binding
    /// - Parameters:
    ///   - recommId: Id of the recommendation request
    ///   - recomms: Obtained recommendations
    ///   - numberNextRecommsCalls: How many times *Recommend Next Items* have been called for this `recommId`
    ///   - abGroup: Name of AB-testing group to which the request belongs if there is a custom AB-testing running.
    public init(recommId: String, recomms: [Recommendation], numberNextRecommsCalls: Int? = nil, abGroup: String? = nil) {
        self.recommId = recommId
        self.recomms = recomms
        self.numberNextRecommsCalls = numberNextRecommsCalls
        self.abGroup = abGroup
    }

    /// Initializes a new `RecommendationResponse` from a decoder
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        recommId = try Self.decodeMandatorySimpleField(container, forKey: .recommId)
        recomms = try Self.decodeMandatorySimpleField(container, forKey: .recomms)
        numberNextRecommsCalls = Self.decodeSimpleField(container, forKey: .numberNextRecommsCalls)
        abGroup = Self.decodeSimpleField(container, forKey: .abGroup)
    }
}
