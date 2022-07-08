//
//  WeatherCoordinator.swift
//  WeatherApp
//
//  Created by Alex Hu on 2022/7/5.
//

import Foundation


struct WeatherCoordinator {
    let vmc = WeatherViewModelCoordinator()
    
    func createContentView() -> ContentView
        let viewModel = vmc.createWeatherViewModel()
        
        return ContentView(weatherViewModel: viewModel);
    }
}

