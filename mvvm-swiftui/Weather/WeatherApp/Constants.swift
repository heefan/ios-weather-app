//
//  Constants.swift
//  WeatherApp
//
//  Created by Alex Hu on 2022/7/4.
//

import Foundation

struct WeatherApi {
    static let key = apiKey
}

extension WeatherApi {
    static let baseURL = url

    static func getCurrentWeatherURL(latitude: Double, longitude: Double) -> String {
        return "\(baseURL)/weather?lat=\(latitude)&lon=\(longitude)&appid=\(key)&units=metric"
    }
}

let apiKey = "82f445ae7792a8adf0b8fe5dcffadcce"
let url = "https://api.openweathermap.org/data/2.5"
let sampleResponseData = """
                {
                "coord": {
                    "lon": -122.08,
                    "lat": 37.39
                },
                "weather": [
                    {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                    }
                ],
                "base": "stations",
                "main": {
                    "temp": 282.55,
                    "feels_like": 281.86,
                    "temp_min": 280.37,
                    "temp_max": 284.26,
                    "pressure": 1023,
                    "humidity": 100
                },
                "visibility": 10000,
                "wind": {
                    "speed": 1.5,
                    "deg": 350
                },
                "clouds": {
                    "all": 1
                },
                "dt": 1560350645,
                "sys": {
                    "type": 1,
                    "id": 5122,
                    "message": 0.0139,
                    "country": "US",
                    "sunrise": 1560343627,
                    "sunset": 1560396563
                },
                "timezone": -25200,
                "id": 420006353,
                "name": "Mountain View",
                "cod": 200
                }
                """
