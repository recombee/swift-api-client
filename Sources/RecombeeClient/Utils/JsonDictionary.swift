import AnyCodable

/// A flexible, JSON-compatible dictionary used throughout the SDK.
public struct JSONDictionary: Codable {
    private var internalStorage: [String: AnyCodable]

    public init(_ dictionary: [String: Any] = [:]) {
        internalStorage = dictionary.mapValues { AnyCodable($0) }
    }

    public var rawValue: [String: Any] {
        internalStorage.mapValues { $0.value }
    }

    public func value<T>(for key: String) -> T? {
        internalStorage[key]?.value as? T
    }

    public subscript<T>(key: String) -> T? {
        value(for: key)
    }

    public subscript(key: String) -> Any? {
        internalStorage[key]?.value
    }

    // Conformance to Codable
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        internalStorage = try container.decode([String: AnyCodable].self)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(internalStorage)
    }
}

extension JSONDictionary: ExpressibleByDictionaryLiteral {
    public init(dictionaryLiteral elements: (String, Any)...) {
        let dict = Dictionary(uniqueKeysWithValues: elements)
        self.init(dict)
    }
}
