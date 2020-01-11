// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let paymentMethodModel = try? newJSONDecoder().decode(PaymentMethodModel.self, from: jsonData)

import Foundation

// MARK: - PaymentMethodModelElement
struct PaymentMethodModelElement: Codable {
    var code, title: String?
}

typealias PaymentMethodModel = [PaymentMethodModelElement]
