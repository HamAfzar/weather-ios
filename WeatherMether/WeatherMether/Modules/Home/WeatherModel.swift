//
//  WeatherModel.swift
//  WeatherMether
//
//  Created by amirhosseinpy on 1/15/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import Foundation

// MARK: - WeatherModel
struct WeatherModel: Codable {
    var current: Current?
    var hourly, daily: [Forcast]?
}

// MARK: - Current
struct Current: Codable {
    var time: Double?
    var city: City?
    var stats: CurrentStats?
}

// MARK: - City
struct City: Codable {
    var id: Double?
    var name, country: String?
    var timezone: Int?
    var sunrise, sunset: Double?
    var lat, lng: Double?
}

// MARK: - CurrentStats
struct CurrentStats: Codable {
    var condition: Condition?
    var iconID: IconID?
    var temp: Double?
    var feelsLike, tempMin, tempMax, pressure: Int?
    var humidity, cloudiness: Int?
    var windSpeed: Double?
    var windDegree, visibility: Int?
    var uv: UV?
    var rain3H, snow3H: Int?

    enum CodingKeys: String, CodingKey {
        case condition
        case iconID = "iconId"
        case temp, feelsLike, tempMin, tempMax, pressure, humidity, cloudiness, windSpeed, windDegree, visibility, uv
        case rain3H = "rain3h"
        case snow3H = "snow3h"
    }
}

enum Condition: String, Codable {
    case thunderstorm = "Thunderstorm"
    case drizzle = "Drizzle"
    case rain = "Rain"
    case snow = "Snow"
    case atmosphere = "Atmosphere"
    case clear = "Clear"
    case clouds = "Clouds"
    case mist = "Mist"
}

enum IconID: String, Codable {
    case clearSkyDay = "01d"
    case clearSkyNight = "01n"
    case fewCloudsDay = "02d"
    case fewCloudsNight = "02n"
    case scatteredCloudsDay = "03d"
    case scatteredCloudsNight = "03n"
    case brokenCloudsDay = "04d"
    case brokenCloudsNight = "04n"
    case showerRainDay = "09d"
    case showerRainNight = "09n"
    case rainDay = "10d"
    case rainNight = "10n"
    case thunderstormDay = "11d"
    case thunderstormNight = "11n"
    case snowDay = "13d"
    case snowNight = "13n"
    case mistDay = "50d"
    case mistNight = "50n"
}

enum UV: String, Codable {
    case low = "LOW"
    case moderate = "MODERATE"
    case high = "HIGH"
    case veryHigh = "VERY_HIGH"
    case extreme = "EXTREME"
    
    func getProperString() -> String {
        switch self {
        case .low:
            return "Low"
        case .moderate:
            return "Moderate"
        case .high:
            return "High"
        case .veryHigh:
            return "Very High"
        case .extreme:
            return "Extreme"
        }
    }
}

// MARK: - Forcast
struct Forcast: Codable, Hashable {    
    var time: Double?
    var stats: ForcastStats?
}

// MARK: - DailyStats
struct ForcastStats: Codable, Hashable {
    var status: Condition?
    var iconID: IconID?
    var temp, tempMin, tempMax: Double?

    enum CodingKeys: String, CodingKey {
        case status
        case iconID = "iconId"
        case temp, tempMin, tempMax
    }
}
