//
//  GetForecasteWeatherRequest.swift
//  OpenWeatherAppCore
//
//  Created by Rodrigo Torres on 02/07/2023.
//

struct GetForecasteWeatherRequest {
    let latitude: String
    let longitude: String
    let units: String = "metrics"
}
