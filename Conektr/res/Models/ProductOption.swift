// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let productOptions = try? newJSONDecoder().decode(ProductOptions.self, from: jsonData)

import Foundation

// MARK: - ProductOption
struct ProductOption: Codable {
    var label, value: String?
}

typealias ProductOptions = [ProductOption]
