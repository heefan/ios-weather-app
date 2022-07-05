//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Alex Hu on 2022/7/4.
//

import Foundation

struct WeatherModel: Codable {
    var date: Int
    var main: WeatherMainModel
    
    enum CodingKeys: String, CodingKey {
        case date = "dt"
        case main = "main"
    }
    
    static func empty() -> WeatherModel {
        return WeatherModel(date: 0,
                            main: WeatherMainModel(temperature: 100.0))
    }
}

struct WeatherMainModel: Codable {
    var temperature: Double
    
    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
    }
}
