//
//  GetCurrentWeatherRequest.swift
//  OpenWeatherAppCore
//
//  Created by Rodrigo Torres on 02/07/2023.
//

struct GetCurrentWeatherRequest {
    let latitude: String
    let longitude: String
    let units: String = "metric"
}
