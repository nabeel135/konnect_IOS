// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let cartsModel = try? newJSONDecoder().decode(CartsModel.self, from: jsonData)

import Foundation

// MARK: - CartsModel
struct CartsModel: Codable {
    var data: [CartDatum]?
}

// MARK: - Datum
struct CartDatum: Codable {
    var itemID: Int?
    var sku: String?
    var qty: Int?
    var name: String?
    var price: Int?
    var productType, quoteID, value: String?

    enum CodingKeys: String, CodingKey {
        case itemID = "item_id"
        case sku, qty, name, price
        case productType = "product_type"
        case quoteID = "quote_id"
        case value
    }
}

typealias QuoteList = [CartDatum]
