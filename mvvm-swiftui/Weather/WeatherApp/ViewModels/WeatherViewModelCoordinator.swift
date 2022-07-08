//
//  WeatherViewModelCoordinator.swift
//  WeatherApp
//
//  Created by Alex Hu on 2022/7/5.
//

import Foundation

//class WeatherViewModelCoordinator {
//    func createWeatherViewModel() -> WeatherViewModel {
//        return WeatherViewModel()
//    }
//}

protocol WeatherViewModelCoordinatorType {
   // associatedtype ViewModelT: WeatherViewModelType
    func createWeatherViewModel() -> WeatherViewModel
}

struct WeatherViewModelCoordinator: WeatherViewModelCoordinatorType {
    func createWeatherViewModel() -> WeatherViewModel {
        return WeatherViewModel()
    }
}
