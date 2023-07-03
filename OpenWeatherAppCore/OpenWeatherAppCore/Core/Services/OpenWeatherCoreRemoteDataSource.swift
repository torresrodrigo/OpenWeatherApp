//
//  OpenWeatherCoreRemoteDataSource.swift
//  OpenWeatherAppCore
//
//  Created by Rodrigo Torres on 02/07/2023.
//

import OpenWeatherNetwork

public struct OpenWeatherCoreRemoteDataSource {
    public static var shared: OpenWeatherCoreRemoteDataSource = OpenWeatherCoreRemoteDataSource()
    private let apiClient: APIClientProtocol
    
    public init(apiClient: APIClientProtocol = APIClient()) {
        self.apiClient = apiClient
    }
    
    public var getCurrentWeather: GetCurrentWeatherAPIDataSource {
        return GetCurrentWeatherAPI(apiClient: apiClient)
    }
    
    public var getForecastWeather: GetForecastWeatherAPIDataSource {
        return GetForecasteWeatherAPI(apiClient: apiClient)
    }
}
