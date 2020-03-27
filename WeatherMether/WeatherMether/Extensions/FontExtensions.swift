//
//  File.swift
//  WeatherMether
//
//  Created by Sadegh on 1/8/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import SwiftUI

extension Font {
    static func sansBold(_ size: CGFloat) -> Font {
        return Font.custom("SansMobile-Bold", size: size)
    }
    
    static func sansLight(_ size: CGFloat) -> Font {
        return Font.custom("SansMobile-Light", size: size)
    }
    
    static func sansMedium(_ size: CGFloat) -> Font {
        return Font.custom("SansMobile-Medium", size: size)
    }
    
    static func sans(_ size: CGFloat) -> Font {
        return Font.custom("SansMobile", size: size)
    }
    
    static func sansBlack(_ size: CGFloat) -> Font {
        return Font.custom("SansMobile-Black", size: size)
    }
    
    static func robotoBold(_ size: CGFloat) -> Font {
        return Font.custom("Roboto-Bold", size: size)
    }
    
    static func robotoLight(_ size: CGFloat) -> Font {
        return Font.custom("Roboto-Light", size: size)
    }
    
    static func robotoMedium(_ size: CGFloat) -> Font {
        return Font.custom("Roboto-Medium", size: size)
    }
    
    static func roboto(_ size: CGFloat) -> Font {
        return Font.custom("Roboto-Regular", size: size)
    }
    
    static func robotoBlack(_ size: CGFloat) -> Font {
        return Font.custom("Roboto-Black", size: size)
    }
}
