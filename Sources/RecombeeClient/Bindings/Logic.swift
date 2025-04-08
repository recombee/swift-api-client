/*
 This file is auto-generated
 */

/// Logic Binding
public struct Logic: RecombeeBinding, Encodable {
    public typealias CodingKeys = LogicCodingKeys

    /// Name of the logic that should be used
    public let name: String

    /// Parameters passed to the logic
    public var settings: JSONDictionary?

    /// Coding keys for decoding/encoding
    public enum LogicCodingKeys: String, CodingKey {
        case name
        case settings
    }

    /// Initializes Logic Binding
    /// - Parameters:
    ///   - name: Name of the logic that should be used
    ///   - settings: Parameters passed to the logic
    public init(name: String, settings: JSONDictionary? = nil) {
        self.name = name
        self.settings = settings
    }

    /// Initializes a new `Logic` from a decoder
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        name = try Self.decodeMandatorySimpleField(container, forKey: .name)
        settings = Self.decodeJSONField(container, forKey: .settings)
    }
}
