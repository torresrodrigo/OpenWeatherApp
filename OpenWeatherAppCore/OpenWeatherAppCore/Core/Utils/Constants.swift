//
//  Constants.swift
//  OpenWeatherAppCore
//
//  Created by Rodrigo Torres on 02/07/2023.
//

import Foundation

enum Constants: String {
    case scheme
    case baseUrl
    case currentWeatherPath
    case forecastWeatherPath
    case apiKey
    
    var value: String {
        switch self {
        case .scheme:
            return "SCHEME"
        case .baseUrl:
            return "BASE_URL"
        case .currentWeatherPath:
            return "CURRENT_WEATHER_PATH"
        case .forecastWeatherPath:
            return "FORECAST_WEATHER_PATH"
        case .apiKey:
            return "API_KEY"
        }
    }
}

