//
//  CurrentWeatherView.swift
//  OpenWeatherApp
//
//  Created by Rodrigo Torres on 03/07/2023.
//

import SwiftUI

struct CurrentWeatherView: View {
    let temperature: Double
    let temperatureMax: Double
    let temperatureMin: Double

    
    var body: some View {
        VStack {
            VStack {
                Text(temperature.description)
            }
            
            HStack {
                Text(temperatureMin.description)
                Text(temperatureMax.description)
            }
        }
    }
}

struct CurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherView(temperature: 25,
                           temperatureMax: 19,
                           temperatureMin: 30)
    }
}
