//
//  CityModel.swift
//  WeatherMether
//
//  Created by amirhosseinpy on 1/29/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import Foundation

struct CityModel: Codable {
    var id: Int?
    var name, state, country: String?
    var coord: Coord?
}

// MARK: - Coord
struct Coord: Codable {
    var lat, lon: Double?
}
