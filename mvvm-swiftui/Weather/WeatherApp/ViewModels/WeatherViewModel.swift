//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Alex Hu on 2022/7/4.
//

import SwiftUI
import CoreLocation

protocol WeatherViewModelType {
    var weather: WeatherModel { get set }
    var city: String { get set }
    func getLocation()
    func updateCity(_ cityInput: String)
}

class WeatherViewModel: WeatherViewModelType, ObservableObject {
    
    @Published var weather = WeatherModel.empty()
    @Published var city = "Taipei" {
        didSet {
            getLocation()
        }
    }
    
    init() {
        getLocation()
    }
    
    func updateCity(_ cityInput: String) {
        city = cityInput
    }
    
    func getLocation() {
        CLGeocoder().geocodeAddressString(city) { (placemarks, error) in
            if let places = placemarks,
               let place = places.first {
                self.getWeather(coordinator: place.location?.coordinate)
            }
        }
    }
    
    private func getWeather(coordinator: CLLocationCoordinate2D?) {
        var requestURL = ""
        
        if let coordinator = coordinator {
            requestURL = WeatherApi.currentWeatherURL(latitude: coordinator.latitude, longitude: coordinator.longitude)
        }
        
        getWeather(city: city, for: requestURL)
    }
    
    private func getWeather(city: String, for urlString: String) {
        guard let url = URL(string: urlString) else {return}
        NetworkManager<WeatherModel>.fetchWeather(for: url) { (result) in
            switch result {
                case .success(let response):
                    DispatchQueue.main.async {
                        self.weather = response
                    }
                case .failure(let error):
                    dump(error)
            }
        }
    }
    
    func getSampleWeather(coordinator: CLLocationCoordinate2D?) {
        let data = sampleResponseData.data(using: .utf8)!
        dump(coordinator)
        do {
            let response = try JSONDecoder().decode(WeatherModel.self, from: data)
            weather = response
        } catch let error {
            dump(error)
        }
    }
}
