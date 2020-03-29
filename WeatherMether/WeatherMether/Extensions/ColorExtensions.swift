//
//  ColorExtensions.swift
//  WeatherMether
//
//  Created by Sadegh on 1/7/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import SwiftUI

enum CustomColorName: String {
    case baseBackground                    = "baseBackground"
    case shadowedViewShadow                = "shadowedViewShadow"
    case baseText                          = "baseTextColor"
    
    var getColor: Color {
        return Color(self.rawValue)
    }
}

