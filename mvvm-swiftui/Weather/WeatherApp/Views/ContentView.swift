//
//  ContentView.swift
//  WeatherApp
//
//  Created by Alex Hu on 2022/7/4.
//

import SwiftUI

struct ContentView<T: WeatherViewModelType>: View {
//    typealias ViewModelT = WeatherViewModelType
    
//    @StateObject var viewModel: T
    var viewModel: T
    @State var searchCity = "Taipei"
    
    var body: some View {
        TextField("", text: $searchCity)
            .padding(.leading, 50)
            .font(.system(size: 20.0))
        Button {
            viewModel.updateCity(searchCity)
        } label: {
            Text("Search City")
        }
        
        Text("\(viewModel.weather.main.temperature)°C")
            .padding()
        Text(viewModel.city)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: WeatherViewModel())
    }
}
