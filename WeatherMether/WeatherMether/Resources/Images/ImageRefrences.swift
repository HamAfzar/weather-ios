//
//  ImageRefrences.swift
//  WeatherMether
//
//  Created by amirhosseinpy on 1/13/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import Foundation
import SwiftUI

enum ImageRefrences: String {
    case weatherTypography            = "ic_weather_typography"
    case weatherStatus                = "ic_weather_status"
    case sunset                       = "ic_detail_sunset"
    case sunRise                      = "ic_detail_sunsrise"
    case feelsLike                    = "ic_detail_feelsLike"
    case chanceOfRain                 = "ic_detail_chanceOfRain"
    
    var getImageName: String {
        return self.rawValue
    }
}
