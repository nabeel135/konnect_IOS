// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let productOption = try? newJSONDecoder().decode(ProductOption.self, from: jsonData)

import Foundation

// MARK: - ProductOption
struct ProductOption: Codable {
    var data: [ProdOpData]?
}

// MARK: - Datum
struct ProdOpData: Codable {
    var id = Int() 
    var attributeID, label: String?
    var position = Int()
    var values: [ProdOPValue] = []
    var productID = Int()

    enum CodingKeys: String, CodingKey {
        case id
        case attributeID = "attribute_id"
        case label, position, values
        case productID = "product_id"
    }
}

// MARK: - Value
struct ProdOPValue: Codable {
    var valueIndex = Int()
    var name = String()

    enum CodingKeys: String, CodingKey {
        case valueIndex = "value_index"
        case name
    }
}
