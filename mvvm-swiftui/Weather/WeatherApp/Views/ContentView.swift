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
        ScrollView {
            LazyVStack(alignment: .center) {
                HStack(alignment: .center, spacing: 20) {
                    TextField("", text: $searchCity)
                        .frame(width: UIScreen.main.bounds.size.width * 3 / 5, height: 25, alignment: .leading)
                        .font(.system(size: 20.0))
                        .border(.secondary)
                    Button {
                        weatherViewModel.city = searchCity
                    } label: {
                        Text("Search")
                    }
                }
            }
            
            LazyVStack(alignment: .leading) {
                Section(header: Text("Result").font(.title)) {
                    Text(weatherViewModel.city)
                        .alignmentGuide(.leading, computeValue: { d in
                            d[.leading]
                        })
                        .padding([.top], 15)
                        .padding([.bottom], 10)
                    Text("\(weatherViewModel.weather.main.temperature)°C")
                        .alignmentGuide(.leading, computeValue: { d in
                            d[.leading]
                        })
                }
            }.padding([.leading], 20)
        }
        
//        VStack(alignment: .leading) {
//            HStack(alignment: .center, spacing: 20) {
//                TextField("", text: $searchCity)
//                    .frame(width: UIScreen.main.bounds.size.width * 3 / 5, height: 25, alignment: .leading)
//                    .font(.system(size: 20.0))
//                    .border(.secondary)
//                Button {
//                    weatherViewModel.city = searchCity
//                } label: {
//                    Text("Search")
//                }
//            }
//            VStack(alignment: .leading) {
//                Section(header: Text("Result").font(.title)) {
//                    Text(weatherViewModel.city)
//                        .alignmentGuide(.leading, computeValue: { d in
//                            d[.leading]
//                        })
//                        .padding([.top], 15)
//                        .padding([.bottom], 10)
//                    Text("\(weatherViewModel.weather.main.temperature)°C")
//                        .alignmentGuide(.leading, computeValue: { d in
//                            d[.leading]
//                        })
//                }
//            }
//            Spacer()
//        }.padding([.top], 30)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
