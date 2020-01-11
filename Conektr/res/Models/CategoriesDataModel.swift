// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let categoriesDataModel = try? newJSONDecoder().decode(CategoriesDataModel.self, from: jsonData)

import Foundation

// MARK: - CategoriesDataModel
struct CategoriesDataModel: Codable {
    var id, parentID: Int?
    var name: String?
    var isActive: Bool?
    var position, level, productCount: Int?
    var childrenData: [CategoriesDataModel]?

    enum CodingKeys: String, CodingKey {
        case id
        case parentID = "parent_id"
        case name
        case isActive = "is_active"
        case position, level
        case productCount = "product_count"
        case childrenData = "children_data"
    }
}
