//
//  BrandsModel.swift
//  Conektr
//
//  Created by Mahad on 12/25/19.
//  Copyright © 2019 Mr. Nabeel. All rights reserved.
//

import Foundation

class BrandsModel: Codable {
    let data: [Datum]?

    init(data: [Datum]?) {
        self.data = data
    }
}

// MARK: - Datum
class Datum: Codable {
    let url, image: String?

    init(url: String?, image: String?) {
        self.url = url
        self.image = image
    }
}
