//
//  GetCurrentWeatherResponse.swift
//  OpenWeatherAppCore
//
//  Created by Rodrigo Torres on 02/07/2023.
//

import Foundation

public struct GetCurrentWeatherResponse: Decodable {
    public let weather: [CurrentWeatherDetail]
    public let main: CurrentWeatherParameters
}

public struct CurrentWeatherDetail: Decodable {
    public let title: String
    public let description: String
    
    enum CodingKeys: String, CodingKey {
        case title = "main"
        case description
    }
}

public struct CurrentWeatherParameters: Decodable {
    public let temperature: Double
    public let temperatureMin: Double
    public let temperatureMax: Double
    
    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case temperatureMin = "temp_min"
        case temperatureMax = "temp_max"
    }
}
