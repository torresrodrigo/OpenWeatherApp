//
//  ContentView.swift
//  OpenWeatherApp
//
//  Created by Rodrigo Torres on 28/06/2023.
//

import SwiftUI
import OpenWeatherAppCore

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        VStack {
            if let data = viewModel.data {
                CurrentWeatherView(temperature: data.main.temperature, temperatureMax: data.main.temperatureMax, temperatureMin: data.main.temperatureMin)
            } else {
                Text("Loading")
            }
        }
        .padding()
        .onAppear {
            Task {
                await viewModel.fetchData()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
