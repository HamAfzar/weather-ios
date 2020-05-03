//
//  CityModel.swift
//  WeatherMether
//
//  Created by amirhosseinpy on 1/29/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import Foundation

struct CityModel: Codable, Identifiable, Hashable {
    var id: Int?
    var name, state, country: String?
    var coord: Coord?
    
    static func == (lhs: CityModel, rhs: CityModel) -> Bool {
        return lhs.id == rhs.id
    }
}

// MARK: - Coord
struct Coord: Codable, Hashable {
    var lat, lon: Double?
}
