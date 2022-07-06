//
//  WeatherCoordinator.swift
//  WeatherApp
//
//  Created by Alex Hu on 2022/7/5.
//

import Foundation

//class WeatherCoordinator {
//    let weatherViewModelCoordinator = WeatherViewModelCoordinator()
//    func createContentView() -> ContentView {
//        return ContentView(weatherViewModel: self.weatherViewModelCoordinator.createWeatherViewModel())
//    }
//}

struct WeatherCoordinator {
    let weatherViewModelCoordinator = WeatherViewModelCoordinator()
    func createContentView() -> ContentView {
        return ContentView(weatherViewModel: self.weatherViewModelCoordinator.createWeatherViewModel())
    }
}
