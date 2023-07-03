//
//  GetForecasteWeatherResponse.swift
//  OpenWeatherAppCore
//
//  Created by Rodrigo Torres on 02/07/2023.
//

import Foundation

public struct GetForecasteWeatherResponse: Decodable {
    let list: [ForecastWeatherList]
}

public struct ForecastWeatherList: Decodable {
    let dateTime: Date
    let weather: [CurrentWeatherDetail]
    let parameters: CurrentWeatherParameters
    
    enum CodingKeys: String, CodingKey {
        case weather
        case dateTime = "dt"
        case parameters = "main"
    }
}
