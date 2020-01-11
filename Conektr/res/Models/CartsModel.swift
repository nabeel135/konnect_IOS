// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let cartsModel = try? newJSONDecoder().decode(CartsModel.self, from: jsonData)

import Foundation

// MARK: - CartsModel
struct CartsModel: Codable {
    var id: Int?
    var createdAt, updatedAt: String?
    var isActive, isVirtual: Bool?
    var items: [CartItem]?
    var itemsCount, itemsQty: Int?
    var customer: Customer?
    var billingAddress: BillingAddressClass?
    var origOrderID: Int?
    var currency: Currency?
    var customerIsGuest, customerNoteNotify: Bool?
    var customerTaxClassID, storeID: Int?
    var extensionAttributes: CartsModelExtensionAttributes?

    enum CodingKeys: String, CodingKey {
        case id
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case isActive = "is_active"
        case isVirtual = "is_virtual"
        case items
        case itemsCount = "items_count"
        case itemsQty = "items_qty"
        case customer
        case billingAddress = "billing_address"
        case origOrderID = "orig_order_id"
        case currency
        case customerIsGuest = "customer_is_guest"
        case customerNoteNotify = "customer_note_notify"
        case customerTaxClassID = "customer_tax_class_id"
        case storeID = "store_id"
        case extensionAttributes = "extension_attributes"
    }
}

// MARK: - BillingAddressClass
struct BillingAddressClass: Codable {
    var id: Int?
    var region: String?
    var regionID: Int?
    var regionCode, countryID: String?
    var street: [String]?
    var company, telephone, postcode, city: String?
    var firstname, lastname: String?
    var customerID: Int?
    var email: String?
    var sameAsBilling, customerAddressID, saveInAddressBook: Int?

    enum CodingKeys: String, CodingKey {
        case id, region
        case regionID = "region_id"
        case regionCode = "region_code"
        case countryID = "country_id"
        case street, telephone, postcode, city, firstname, lastname
        case customerID = "customer_id"
        case email
        case sameAsBilling = "same_as_billing"
        case customerAddressID = "customer_address_id"
        case saveInAddressBook = "save_in_address_book"
    }
}

// MARK: - Currency
struct Currency: Codable {
    var globalCurrencyCode, baseCurrencyCode, storeCurrencyCode, quoteCurrencyCode: String?
    var storeToBaseRate, storeToQuoteRate, baseToGlobalRate, baseToQuoteRate: Int?

    enum CodingKeys: String, CodingKey {
        case globalCurrencyCode = "global_currency_code"
        case baseCurrencyCode = "base_currency_code"
        case storeCurrencyCode = "store_currency_code"
        case quoteCurrencyCode = "quote_currency_code"
        case storeToBaseRate = "store_to_base_rate"
        case storeToQuoteRate = "store_to_quote_rate"
        case baseToGlobalRate = "base_to_global_rate"
        case baseToQuoteRate = "base_to_quote_rate"
    }
}

// MARK: - Customer
struct Customer: Codable {
    var id, groupID: Int?
    var defaultBilling, defaultShipping, createdAt, updatedAt: String?
    var createdIn, email, firstname, lastname: String?
    var gender, storeID: Int?
    var taxvat: String?
    var websiteID: Int?
    var addresses: [AddressElement]?
    var disableAutoGroupChange: Int?
    var extensionAttributes: CustomerExtensionAttributes?
    var customAttributes: [CartCustomAttribute]?

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

// MARK: - AddressElement
struct AddressElement: Codable {
    var id, customerID: Int?
    var region: Region?
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
struct Region: Codable {
    var regionCode, region: String?
    var regionID: Int?

    enum CodingKeys: String, CodingKey {
        case regionCode = "region_code"
        case region
        case regionID = "region_id"
    }
}

// MARK: - CustomAttribute
struct CartCustomAttribute: Codable {
    var attributeCode, value: String?

    enum CodingKeys: String, CodingKey {
        case attributeCode = "attribute_code"
        case value
    }
}

// MARK: - CustomerExtensionAttributes
struct CustomerExtensionAttributes: Codable {
    var isSubscribed: Bool?

    enum CodingKeys: String, CodingKey {
        case isSubscribed = "is_subscribed"
    }
}

// MARK: - CartsModelExtensionAttributes
struct CartsModelExtensionAttributes: Codable {
    var shippingAssignments: [ShippingAssignment]?

    enum CodingKeys: String, CodingKey {
        case shippingAssignments = "shipping_assignments"
    }
}

// MARK: - ShippingAssignment
struct ShippingAssignment: Codable {
    var shipping: Shipping?
    var items: [CartItem]?
}

// MARK: - CartItem
struct CartItem: Codable {
   var itemID: Int?
    var sku: String?
    var qty: Int?
    var name: String?
    var price: Double?
    var productType: ProductType?
    var quoteID: String?
    enum CodingKeys: String, CodingKey {
        case itemID = "item_id"
        case sku, qty, name, price
        case productType = "product_type"
        case quoteID = "quote_id"
    }
}

    enum ProductType: String, Codable {
    case configurable = "configurable"
    case simple = "simple"
}


// MARK: - Shipping
struct Shipping: Codable {
    var address: BillingAddressClass?
    var method: String?
}

// MARK: - Encode/decode helpers

class CartJSONNull: Codable, Hashable {

    public static func == (lhs: CartJSONNull, rhs: CartJSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(CartJSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for CartJSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

