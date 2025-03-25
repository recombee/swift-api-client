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

    /// Coding keys for decoding/encoding
    public enum RecommendationCodingKeys: String, CodingKey {
        case id
        case values
    }

    /// Initializes Recommendation Binding
    /// - Parameters:
    ///   - id: Id of the recommended item
    ///   - values: Property values of the recommended item
    public init(id: String, values: JSONDictionary? = nil) {
        self.id = id
        self.values = values
    }

    /// Initializes a new `Recommendation` from a decoder
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try Self.decodeMandatorySimpleField(container, forKey: .id)
        values = Self.decodeJSONField(container, forKey: .values)
    }
}
