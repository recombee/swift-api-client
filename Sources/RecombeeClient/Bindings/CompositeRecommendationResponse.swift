/*
 This file is auto-generated
 */

/// CompositeRecommendationResponse Binding
public struct CompositeRecommendationResponse: RecombeeBinding, Encodable {
    public typealias CodingKeys = CompositeRecommendationResponseCodingKeys

    /// Id of the composite recommendation request
    public let recommId: String

    /// Parameters of the source stage
    public let source: Recommendation

    /// Obtained recommendations
    public let recomms: [Recommendation]

    /// How many times *Recommend Next Items* have been called for this `recommId`
    public var numberNextRecommsCalls: Int?

    /// Coding keys for decoding/encoding
    public enum CompositeRecommendationResponseCodingKeys: String, CodingKey {
        case recommId
        case source
        case recomms
        case numberNextRecommsCalls
    }

    /// Initializes CompositeRecommendationResponse Binding
    /// - Parameters:
    ///   - recommId: Id of the composite recommendation request
    ///   - source: Parameters of the source stage
    ///   - recomms: Obtained recommendations
    ///   - numberNextRecommsCalls: How many times *Recommend Next Items* have been called for this `recommId`
    public init(recommId: String, source: Recommendation, recomms: [Recommendation], numberNextRecommsCalls: Int? = nil) {
        self.recommId = recommId
        self.source = source
        self.recomms = recomms
        self.numberNextRecommsCalls = numberNextRecommsCalls
    }

    /// Initializes a new `CompositeRecommendationResponse` from a decoder
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        recommId = try Self.decodeMandatorySimpleField(container, forKey: .recommId)
        source = try Self.decodeMandatorySimpleField(container, forKey: .source)
        recomms = try Self.decodeMandatorySimpleField(container, forKey: .recomms)
        numberNextRecommsCalls = Self.decodeSimpleField(container, forKey: .numberNextRecommsCalls)
    }
}
