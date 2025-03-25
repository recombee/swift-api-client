import Foundation

/// A wrapper used for decoding plain string responses from the Recombee API.
public struct StringResponseBinding: RecombeeBinding {
    public typealias CodingKeys = NoCodingKeys

    let response: String

    /// Initializer for direct string input
    public init(response: String) {
        self.response = response
    }

    /// Initializer for decoding from a `Decoder`
    public init(from decoder: Decoder) throws {
        response = try decoder.singleValueContainer().decode(String.self)
    }

    public enum NoCodingKeys: CodingKey {}
}
