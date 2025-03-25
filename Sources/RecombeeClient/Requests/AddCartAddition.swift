/*
 This file is auto-generated
 */

import Foundation

/// Adds a cart addition of the given item made by the given user.
public struct AddCartAddition: Request {
    public typealias Response = StringResponseBinding

    /// User who added the item to the cart
    public let userId: String

    /// Item added to the cart
    public let itemId: String

    /// UTC timestamp of the cart addition as ISO8601-1 pattern or UTC epoch time. The default value is the current time.
    public var timestamp: Date? = nil

    /// Sets whether the given user/item should be created if not present in the database.
    public var cascadeCreate: Bool? = true

    /// Amount (number) added to cart. The default is 1. For example, if `user-x` adds two `item-y` during a single order (session...), the `amount` should equal 2.
    public var amount: Double? = nil

    /// Price of the added item. If `amount` is greater than 1, the sum of prices of all the items should be given.
    public var price: Double? = nil

    /// If this cart addition is based on a recommendation request, `recommId` is the id of the clicked recommendation.
    public var recommId: String? = nil

    /// A dictionary of additional data for the interaction.
    public var additionalData: JSONDictionary? = nil

    /// Initializes AddCartAddition request
    /// - Parameters:
    ///   - userId: User who added the item to the cart
    ///   - itemId: Item added to the cart
    ///   - timestamp: UTC timestamp of the cart addition as ISO8601-1 pattern or UTC epoch time. The default value is the current time.
    ///   - cascadeCreate: Sets whether the given user/item should be created if not present in the database.
    ///   - amount: Amount (number) added to cart. The default is 1. For example, if `user-x` adds two `item-y` during a single order (session...), the `amount` should equal 2.
    ///   - price: Price of the added item. If `amount` is greater than 1, the sum of prices of all the items should be given.
    ///   - recommId: If this cart addition is based on a recommendation request, `recommId` is the id of the clicked recommendation.
    ///   - additionalData: A dictionary of additional data for the interaction.
    public init(userId: String, itemId: String, timestamp: Date? = nil, cascadeCreate: Bool? = true, amount: Double? = nil, price: Double? = nil, recommId: String? = nil, additionalData: JSONDictionary? = nil) {
        self.userId = userId
        self.itemId = itemId
        self.timestamp = timestamp
        self.cascadeCreate = cascadeCreate
        self.amount = amount
        self.price = price
        self.recommId = recommId
        self.additionalData = additionalData
    }

    /// The API path for the request
    public var path: String { "/cartadditions/" }

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
            "userId": userId,
            "itemId": itemId,
        ]

        if let timestamp = timestamp {
            body["timestamp"] = ISO8601DateFormatter().string(from: timestamp)
        }

        if let cascadeCreate = cascadeCreate {
            body["cascadeCreate"] = cascadeCreate
        }

        if let amount = amount {
            body["amount"] = amount
        }

        if let price = price {
            body["price"] = price
        }

        if let recommId = recommId {
            body["recommId"] = recommId
        }

        if let additionalData = additionalData {
            body["additionalData"] = additionalData
        }

        return body
    }
}
