//
//  EndPoints.swift
//  WeatherApp
//
//  Created by Alex Hu on 2022/7/15.
//

import Foundation

struct Endpoints {
    static let openWeather = "https://api.openweathermap.org/data/2.5"
}

struct WeatherApi {
    static let key = apiKey
}

// see get parameters as reference
extension WeatherApi {
    static let baseURL = "https://api.openweathermap.org/data/2.5"
    
    // Getter, setter can be override
    // ref: https://stackoverflow.com/questions/29971528/overriding-getter-in-swift
    static func currentWeatherURL(latitude: Double, longitude: Double) -> String {
        return "\(baseURL)/weather?lat=\(latitude)&lon=\(longitude)&appid=\(key)&units=metric"
    }
    
    static let agent = Agent()
    
}
