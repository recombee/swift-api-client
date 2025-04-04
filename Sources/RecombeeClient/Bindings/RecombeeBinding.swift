import AnyCodable

/// A protocol for response types that can be decoded from the Recombee API.
public protocol RecombeeBinding: Decodable, Sendable {
    associatedtype CodingKeys: Swift.CodingKey
}

public extension RecombeeBinding {
    static func decodeSimpleField<T: Decodable>(
        _ container: KeyedDecodingContainer<CodingKeys>,
        forKey key: CodingKeys
    ) -> T? {
        return try? container.decode(T.self, forKey: key)
    }

    static func decodeMandatorySimpleField<T: Decodable>(
        _ container: KeyedDecodingContainer<CodingKeys>,
        forKey key: CodingKeys
    ) throws -> T {
        return try container.decode(T.self, forKey: key)
    }

    static func decodeJSONField(
        _ container: KeyedDecodingContainer<CodingKeys>,
        forKey key: CodingKeys
    ) -> JSONDictionary? {
        return try? container.decode(JSONDictionary.self, forKey: key)
    }
}
