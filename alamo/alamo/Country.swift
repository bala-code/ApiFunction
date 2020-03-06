//
//  Country.swift
//  alamo
//
//  Created by user165007 on 3/6/20.
//  Copyright © 2020 user165007. All rights reserved.
//

import Foundation

struct Country: Decodable {
    var name: String?
    var capital: String?
    var countryCode: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case capital = "capital"
        case countryCode = "alpha3Code"
    }
}
