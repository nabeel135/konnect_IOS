// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let productDetailModel = try? newJSONDecoder().decode(ProductDetailModel.self, from: jsonData)

import Foundation

// MARK: - ProductDetailModel
struct ProductDetailModel: Codable {
    var id: Int?
    var sku, name: String?
    var attributeSetID: Int?
    var price: Double?
    var status, visibility: Int?
    var typeID, createdAt, updatedAt: String?
    var weight: Int?
    var extensionAttributes: ProductDetailModelExtensionAttributes?
    var productLinks, options: [ProJSONAny]?
    var mediaGalleryEntries: [MediaGalleryEntry]?
    var tierPrices: [ProTierPrice]?
    var customAttributes: [ProCustomAttribute]?

    enum CodingKeys: String, CodingKey {
        case id, sku, name
        case attributeSetID = "attribute_set_id"
        case price, status, visibility
        case typeID = "type_id"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case weight
        case extensionAttributes = "extension_attributes"
        case productLinks = "product_links"
        case options
        case mediaGalleryEntries = "media_gallery_entries"
        case tierPrices = "tier_prices"
        case customAttributes = "custom_attributes"
    }
}

// MARK: - CustomAttribute
struct ProCustomAttribute: Codable {
    var attributeCode: String?
    var value: CustomAttributeValue?

    enum CodingKeys: String, CodingKey {
        case attributeCode = "attribute_code"
        case value
    }
}

enum CustomAttributeValue: Codable {
    case string(String)
    case unionArray([ValueElement])

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([ValueElement].self) {
            self = .unionArray(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(CustomAttributeValue.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for CustomAttributeValue"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let x):
            try container.encode(x)
        case .unionArray(let x):
            try container.encode(x)
        }
    }
}

enum ValueElement: Codable {
    case bool(Bool)
    case integer(Int)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Bool.self) {
            self = .bool(x)
            return
        }
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(ValueElement.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for ValueElement"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .bool(let x):
            try container.encode(x)
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

// MARK: - ProductDetailModelExtensionAttributes
struct ProductDetailModelExtensionAttributes: Codable {
    var websiteIDS: [Int]?
    var categoryLinks: [CategoryLink]?

    enum CodingKeys: String, CodingKey {
        case websiteIDS = "website_ids"
        case categoryLinks = "category_links"
    }
}

// MARK: - CategoryLink
struct CategoryLink: Codable {
    var position: Int?
    var categoryID: String?

    enum CodingKeys: String, CodingKey {
        case position
        case categoryID = "category_id"
    }
}

// MARK: - MediaGalleryEntry
struct MediaGalleryEntry: Codable {
    var id: Int?
    var mediaType: String?
    var label: ProJSONNull?
    var position: Int?
    var disabled: Bool?
    var types: [String]?
    var file: String?

    enum CodingKeys: String, CodingKey {
        case id
        case mediaType = "media_type"
        case label, position, disabled, types, file
    }
}

// MARK: - TierPrice
struct ProTierPrice: Codable {
    var customerGroupID, qty: Int?
    var value: Double?
    var extensionAttributes: ProTierPriceExtensionAttributes?

    enum CodingKeys: String, CodingKey {
        case customerGroupID = "customer_group_id"
        case qty, value
        case extensionAttributes = "extension_attributes"
    }
}

// MARK: - TierPriceExtensionAttributes
struct ProTierPriceExtensionAttributes: Codable {
    var websiteID: Int?

    enum CodingKeys: String, CodingKey {
        case websiteID = "website_id"
    }
}

// MARK: - Encode/decode helpers

class ProJSONNull: Codable, Hashable {

    public static func == (lhs: ProJSONNull, rhs: ProJSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(ProJSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for ProJSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class ProJSONCodingKey: CodingKey {
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

class ProJSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode ProJSONAny")
        return DecodingError.typeMismatch(ProJSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode ProJSONAny")
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
            return ProJSONNull()
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
                return ProJSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: ProJSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<ProJSONCodingKey>, forKey key: ProJSONCodingKey) throws -> Any {
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
                return ProJSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: ProJSONCodingKey.self, forKey: key) {
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

    static func decodeDictionary(from container: inout KeyedDecodingContainer<ProJSONCodingKey>) throws -> [String: Any] {
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
            } else if value is ProJSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: ProJSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<ProJSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = ProJSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is ProJSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: ProJSONCodingKey.self, forKey: key)
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
        } else if value is ProJSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try ProJSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: ProJSONCodingKey.self) {
            self.value = try ProJSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try ProJSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try ProJSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: ProJSONCodingKey.self)
            try ProJSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try ProJSONAny.encode(to: &container, value: self.value)
        }
    }
}
