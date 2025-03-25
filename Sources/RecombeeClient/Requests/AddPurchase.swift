/*
 This file is auto-generated
 */

import Foundation

/// Adds a purchase of the given item made by the given user.
public struct AddPurchase: Request {
    public typealias Response = StringResponseBinding

    /// User who purchased the item
    public let userId: String

    /// Purchased item
    public let itemId: String

    /// UTC timestamp of the purchase as ISO8601-1 pattern or UTC epoch time. The default value is the current time.
    public var timestamp: Date? = nil

    /// Sets whether the given user/item should be created if not present in the database.
    public var cascadeCreate: Bool? = true

    /// Amount (number) of purchased items. The default is 1. For example, if `user-x` purchases two `item-y` during a single order (session...), the `amount` should equal 2.
    public var amount: Double? = nil

    /// Price paid by the user for the item. If `amount` is greater than 1, the sum of prices of all the items should be given.
    public var price: Double? = nil

    /// Your profit from the purchased item. The profit is natural in the e-commerce domain (for example, if `user-x` purchases `item-y` for $100 and the gross margin is 30 %, then the profit is $30) but is also applicable in other domains (for example, at a news company it may be income from a displayed advertisement on article page). If `amount` is greater than 1, the sum of profit of all the items should be given.
    public var profit: Double? = nil

    /// If this purchase is based on a recommendation request, `recommId` is the id of the clicked recommendation.
    public var recommId: String? = nil

    /// A dictionary of additional data for the interaction.
    public var additionalData: JSONDictionary? = nil

    /// Initializes AddPurchase request
    /// - Parameters:
    ///   - userId: User who purchased the item
    ///   - itemId: Purchased item
    ///   - timestamp: UTC timestamp of the purchase as ISO8601-1 pattern or UTC epoch time. The default value is the current time.
    ///   - cascadeCreate: Sets whether the given user/item should be created if not present in the database.
    ///   - amount: Amount (number) of purchased items. The default is 1. For example, if `user-x` purchases two `item-y` during a single order (session...), the `amount` should equal 2.
    ///   - price: Price paid by the user for the item. If `amount` is greater than 1, the sum of prices of all the items should be given.
    ///   - profit: Your profit from the purchased item. The profit is natural in the e-commerce domain (for example, if `user-x` purchases `item-y` for $100 and the gross margin is 30 %, then the profit is $30) but is also applicable in other domains (for example, at a news company it may be income from a displayed advertisement on article page). If `amount` is greater than 1, the sum of profit of all the items should be given.
    ///   - recommId: If this purchase is based on a recommendation request, `recommId` is the id of the clicked recommendation.
    ///   - additionalData: A dictionary of additional data for the interaction.
    public init(userId: String, itemId: String, timestamp: Date? = nil, cascadeCreate: Bool? = true, amount: Double? = nil, price: Double? = nil, profit: Double? = nil, recommId: String? = nil, additionalData: JSONDictionary? = nil) {
        self.userId = userId
        self.itemId = itemId
        self.timestamp = timestamp
        self.cascadeCreate = cascadeCreate
        self.amount = amount
        self.price = price
        self.profit = profit
        self.recommId = recommId
        self.additionalData = additionalData
    }

    /// The API path for the request
    public var path: String { "/purchases/" }

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

        if let profit = profit {
            body["profit"] = profit
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
