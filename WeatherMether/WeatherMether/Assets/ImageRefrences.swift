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
    case weatherTypography = "ic_weather_typography"
    case weatherStatus = "ic_weather_status"
    
    var getImageName: String {
        return self.rawValue
    }
}
