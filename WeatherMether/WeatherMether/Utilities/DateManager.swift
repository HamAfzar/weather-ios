//
//  DateManager.swift
//  WeatherMether
//
//  Created by amirhosseinpy on 2/18/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import Foundation

struct DateManager {
    func formatDate(timeValue: Double?) -> String? {
        guard let timeValue = timeValue else { return nil }
        
        let date = getDateFromDouble(javaTimeStamp: timeValue)
        let dateFotmatter = DateFormatter()
        dateFotmatter.calendar = getCalendar()
        dateFotmatter.dateFormat = "EEE, dd MMM"
        
        return (dateFotmatter.string(from: date))
    }
    
    func formatTime(timeValue: Double?) -> String? {
        guard let timeValue = timeValue else { return nil }
        
        let date = getDateFromDouble(javaTimeStamp: timeValue)
        let dateFotmatter = DateFormatter()
        dateFotmatter.calendar = getCalendar()
        dateFotmatter.dateFormat = "ha"
        
        return (dateFotmatter.string(from: date))
    }
    
    func getDateFromDouble(javaTimeStamp: Double) -> Date {
        return Date.init(timeIntervalSince1970: TimeInterval(javaTimeStamp))
    }
    
    func getCalendar() -> Calendar {
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = .current
        return calendar
    }
}
