//
//  ContentView.swift
//  WeatherApp
//
//  Created by Alex Hu on 2022/7/4.
//

import SwiftUI

struct ContentView: View {
    @StateObject var weatherViewModel = WeatherViewModel()
    @State var searchCity = "Taipei"
//    var weatherCoordinator: WeatherCoordinator!
    
    var body: some View {
        TextField("", text: $searchCity)
            .padding(.leading, 50)
            .font(.system(size: 20.0))
        Button {
            weatherViewModel.city = searchCity
        } label: {
            Text("Search City")
        }
        
        Text("\(weatherViewModel.weather.main.temperature)°C")
            .padding()
        Text(weatherViewModel.city)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
