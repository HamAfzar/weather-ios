//
//  DateExtensions.swift
//  WeatherMether
//
//  Created by Sadegh on 1/22/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import Foundation

extension Date {
    public var dayOfWeek: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self).capitalized
    }
    
    public func timeOfDate(dateFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
        return dateFormatter.string(from: self)
    }
}
