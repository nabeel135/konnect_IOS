//
//  CustomerDetailModel.swift
//  Conektr
//
//  Created by Mahad on 1/4/20.
//  Copyright © 2020 Mr. Nabeel. All rights reserved.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let customerDetailModel = try? newJSONDecoder().decode(CustomerDetailModel.self, from: jsonData)

import Foundation

// MARK: - CustomerDetailModel
struct CustomerDetailModel: Codable {
    var id, groupID: Int?
    var defaultBilling, defaultShipping, createdAt, updatedAt: String?
    var createdIn, email, firstname, lastname: String?
    var gender, storeID: Int?
    var taxvat: String?
    var websiteID: Int?
    var addresses: [Address]?
    var disableAutoGroupChange: Int?
    var extensionAttributes: ExtensionAttributes?
    var customAttributes: [CustomDetailAttribute]?

    enum CodingKeys: String, CodingKey {
        case id
        case groupID = "group_id"
        case defaultBilling = "default_billing"
        case defaultShipping = "default_shipping"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case createdIn = "created_in"
        case email, firstname, lastname, gender
        case storeID = "store_id"
        case taxvat
        case websiteID = "website_id"
        case addresses
        case disableAutoGroupChange = "disable_auto_group_change"
        case extensionAttributes = "extension_attributes"
        case customAttributes = "custom_attributes"
    }
}

// MARK: - Address
struct Address: Codable {
    var id, customerID: Int?
    var region: CustomRegion?
    var regionID: Int?
    var countryID: String?
    var street: [String]?
    var company, telephone, postcode, city: String?
    var firstname, lastname: String?
    var defaultShipping, defaultBilling: Bool?

    enum CodingKeys: String, CodingKey {
        case id
        case customerID = "customer_id"
        case region
        case regionID = "region_id"
        case countryID = "country_id"
        case street, company, telephone, postcode, city, firstname, lastname
        case defaultShipping = "default_shipping"
        case defaultBilling = "default_billing"
    }
}

// MARK: - Region
struct CustomRegion: Codable {
    var regionCode, region: String?
    var regionID: Int?

    enum CodingKeys: String, CodingKey {
        case regionCode = "region_code"
        case region
        case regionID = "region_id"
    }
}

// MARK: - CustomAttribute
struct CustomDetailAttribute: Codable {
    var attributeCode, value: String?

    enum CodingKeys: String, CodingKey {
        case attributeCode = "attribute_code"
        case value
    }
}

// MARK: - ExtensionAttributes
struct ExtensionAttributes: Codable {
    var isSubscribed: Bool?

    enum CodingKeys: String, CodingKey {
        case isSubscribed = "is_subscribed"
    }
}

