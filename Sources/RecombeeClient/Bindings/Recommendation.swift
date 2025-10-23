/*
 This file is auto-generated
 */

/// Recommendation Binding
public struct Recommendation: RecombeeBinding, Encodable {
    public typealias CodingKeys = RecommendationCodingKeys

    /// Id of the recommended item
    public let id: String

    /// Property values of the recommended item
    public var values: JSONDictionary?

    /// Dictionary of evaluated ReQL expressions specified in the request and calculated for the recommended item.
    /// The keys are the names of the ReQL expressions, and the values are the results of the evaluations.

    public var reqlEvaluations: JSONDictionary?

    /// Coding keys for decoding/encoding
    public enum RecommendationCodingKeys: String, CodingKey {
        case id
        case values
        case reqlEvaluations
    }

    /// Initializes Recommendation Binding
    /// - Parameters:
    ///   - id: Id of the recommended item
    ///   - values: Property values of the recommended item
    ///   - reqlEvaluations: Dictionary of evaluated ReQL expressions specified in the request and calculated for the recommended item.
    /// The keys are the names of the ReQL expressions, and the values are the results of the evaluations.

    public init(id: String, values: JSONDictionary? = nil, reqlEvaluations: JSONDictionary? = nil) {
        self.id = id
        self.values = values
        self.reqlEvaluations = reqlEvaluations
    }

    /// Initializes a new `Recommendation` from a decoder
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try Self.decodeMandatorySimpleField(container, forKey: .id)
        values = Self.decodeJSONField(container, forKey: .values)
        reqlEvaluations = Self.decodeJSONField(container, forKey: .reqlEvaluations)
    }
}
