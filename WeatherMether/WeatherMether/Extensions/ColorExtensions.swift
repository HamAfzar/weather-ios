//
//  ColorExtensions.swift
//  WeatherMether
//
//  Created by Sadegh on 1/7/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import SwiftUI
import Foundation
import UIKit

extension Color {
    
    init(netHex: UInt) {
        let red = (netHex >> 16) & 0xff
        let green = (netHex >> 8) & 0xff
        let blue = netHex & 0xff
        
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(.displayP3, red: Double(red) / 255.0, green: Double(green) / 255.0, blue: Double(blue) / 255.0, opacity: 1.0)
    }
}

extension Color {
    public static var baseBackground: Color {
        return Color(netHex: 0xF7F7F7)
    }
    
    public static var shadowedViewBorder: Color {
        return Color(netHex: 0xffffff)
    }
    
    public static var shadowedViewBackground: Color {
        return Color(netHex: 0xf7f7f7)
    }
}
