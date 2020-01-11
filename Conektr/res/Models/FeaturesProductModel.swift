// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let featuresProductModel = try? newJSONDecoder().decode(FeaturesProductModel.self, from: jsonData)

import Foundation

// MARK: - FeaturesProductModel
class FeaturesProductModel: Codable {
    var data: [pdata]?

    init(data: [pdata]?) {
        self.data = data
    }
}

// MARK: - Datum
class pdata: Codable {
    var distributorID: String?
    var distributorName: DistributorName?
    var id: Int?
    var sku, name: String?
    var attributeSetID: Int?
    var price: Double?
    var status, visibility: Int?
    var typeID: TypeID?
    var createdAt, updatedAt: String?
    var weight: Int?
    var productLinks, tierPrices: [JSONAny]?
    var customAttributes: [CustomAttribute]?

    enum CodingKeys: String, CodingKey {
        case distributorID = "distributor_id"
        case distributorName = "distributor_name"
        case id, sku, name
        case attributeSetID = "attribute_set_id"
        case price, status, visibility
        case typeID = "type_id"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case weight
        case productLinks = "product_links"
        case tierPrices = "tier_prices"
        case customAttributes = "custom_attributes"
    }

    init(distributorID: String?, distributorName: DistributorName?, id: Int?, sku: String?, name: String?, attributeSetID: Int?, price: Double?, status: Int?, visibility: Int?, typeID: TypeID?, createdAt: String?, updatedAt: String?, weight: Int?, productLinks: [JSONAny]?, tierPrices: [JSONAny]?, customAttributes: [CustomAttribute]?) {
        self.distributorID = distributorID
        self.distributorName = distributorName
        self.id = id
        self.sku = sku
        self.name = name
        self.attributeSetID = attributeSetID
        self.price = price
        self.status = status
        self.visibility = visibility
        self.typeID = typeID
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.weight = weight
        self.productLinks = productLinks
        self.tierPrices = tierPrices
        self.customAttributes = customAttributes
    }
}

// MARK: - CustomAttribute
class CustomAttribute: Codable {
    var attributeCode: AttributeCode?
    var value: Value?

    enum CodingKeys: String, CodingKey {
        case attributeCode = "attribute_code"
        case value
    }

    init(attributeCode: AttributeCode?, value: Value?) {
        self.attributeCode = attributeCode
        self.value = value
    }
}

enum AttributeCode: String, Codable {
    case attributeCodeDescription = "description"
    case barcode = "barcode"
    case brands = "brands"
    case bssCpwAjax = "bss_cpw_ajax"
    case callforpriceCustomergroup = "callforprice_customergroup"
    case callforpriceText = "callforprice_text"
    case callforpriceType = "callforprice_type"
    case categoryIDS = "category_ids"
    case cost = "cost"
    case countryOfManufacture = "country_of_manufacture"
    case flavour = "flavour"
    case giftMessageAvailable = "gift_message_available"
    case hasOptions = "has_options"
    case hideQuoteBuyButton = "hide_quote_buy_button"
    case image = "image"
    case imageLabel = "image_label"
    case metaDescription = "meta_description"
    case metaKeyword = "meta_keyword"
    case metaTitle = "meta_title"
    case msrpDisplayActualPriceType = "msrp_display_actual_price_type"
    case newsFromDate = "news_from_date"
    case newsToDate = "news_to_date"
    case optionsContainer = "options_container"
    case pieces = "pieces"
    case priceType = "price_type"
    case priceView = "price_view"
    case pricing = "pricing"
    case prodConfig = "prod_config"
    case prodConfigNAS = "prod_config_nas"
    case prodconfig = "prodconfig"
    case productConfigAlo = "product_config_alo"
    case productConfigChoithram = "product_config_choithram"
    case productConfigEsa = "product_config_esa"
    case productConfigMp = "product_config_mp"
    case productConfigNtde = "product_config_ntde"
    case productConfigUnitra = "product_config_unitra"
    case quantityAndStockStatus = "quantity_and_stock_status"
    case rageSlTimespan = "rage_sl_timespan"
    case rageSlTimespanQty = "rage_sl_timespan_qty"
    case requiredOptions = "required_options"
    case sapCode = "sap_code"
    case sapItemcode = "sap_itemcode"
    case shipmentType = "shipment_type"
    case shortDescription = "short_description"
    case size = "size"
    case skuType = "sku_type"
    case smFeatured = "sm_featured"
    case smallImage = "small_image"
    case smallImageLabel = "small_image_label"
    case specialFromDate = "special_from_date"
    case specialPrice = "special_price"
    case specialToDate = "special_to_date"
    case swatchImage = "swatch_image"
    case taxClassID = "tax_class_id"
    case thumbnail = "thumbnail"
    case thumbnailLabel = "thumbnail_label"
    case tsDimensionsHeight = "ts_dimensions_height"
    case tsDimensionsLength = "ts_dimensions_length"
    case tsDimensionsWidth = "ts_dimensions_width"
    case urlKey = "url_key"
    case vansalesID = "vansales_id"
    case variant = "variant"
    case variantAlo = "variant_alo"
    case variantChoithrams = "variant_choithrams"
    case variantEsa = "variant_esa"
    case variantMp = "variant_mp"
    case variantNAS = "variant_nas"
    case variantNtde = "variant_ntde"
    case variantUnitra = "variant_unitra"
    case webposVisible = "webpos_visible"
    case weightType = "weight_type"
}


enum Value: Codable {
    case string(String)
    case stringArray([String])

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([String].self) {
            self = .stringArray(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(Value.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Value"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let x):
            try container.encode(x)
        case .stringArray(let x):
            try container.encode(x)
        }
    }
    func string() -> String? {
            switch self {
            case .string(let x):
                return x
            case .stringArray(let x):
                return x.first
            }
    }
}

enum DistributorName: String, Codable {
    case choithrams = "Choithrams"
    case gatiDubai = "Gati Dubai"
    case mets = "METS"
    case unitra = "UNITRA"
}

enum TypeID: String, Codable {
    case configurable = "configurable"
    case simple = "simple"
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
