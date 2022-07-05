//
//  WeatherApp.swift
//  WeatherApp
//
//  Created by Alex Hu on 2022/7/4.
//

import SwiftUI

@main
struct WeatherApp: App {
    var weatherCoordinator = WeatherCoordinator()
    var body: some Scene {
        WindowGroup {
            weatherCoordinator.createContentView()
//            ContentView()
        }
    }
}
