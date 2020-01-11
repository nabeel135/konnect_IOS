// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let countryandRegionModel = try? newJSONDecoder().decode(CountryandRegionModel.self, from: jsonData)

import Foundation

// MARK: - CountryandRegionModelElement
struct CountryandRegionModelElement: Codable {
    var id, twoLetterAbbreviation, threeLetterAbbreviation, fullNameLocale: String?
    var fullNameEnglish: String?
    var availableRegions: [AvailableRegion]?

    enum CodingKeys: String, CodingKey {
        case id
        case twoLetterAbbreviation = "two_letter_abbreviation"
        case threeLetterAbbreviation = "three_letter_abbreviation"
        case fullNameLocale = "full_name_locale"
        case fullNameEnglish = "full_name_english"
        case availableRegions = "available_regions"
    }
}

// MARK: - AvailableRegion
struct AvailableRegion: Codable {
    var id, code, name: String?
}

typealias CountryandRegionModel = [CountryandRegionModelElement]
