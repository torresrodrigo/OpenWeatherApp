//
//  GetForecasteWeatherAPI.swift
//  OpenWeatherAppCore
//
//  Created by Rodrigo Torres on 02/07/2023.
//

import OpenWeatherNetwork

public protocol GetForecastWeatherAPIDataSource {
    func execute(latitude: String, longitude: String) async throws -> GetForecasteWeatherResponse
}

class GetForecasteWeatherAPI: GetForecastWeatherAPIDataSource {
    
    private let apiClient: APIClientProtocol
    
    init(apiClient: APIClientProtocol = APIClient()) {
        self.apiClient = apiClient
    }
    
    func execute(latitude: String, longitude: String) async throws -> GetForecasteWeatherResponse {
        let model: GetForecasteWeatherRequest = GetForecasteWeatherRequest(latitude: latitude, longitude: longitude)
        let endpoint: EndpointProvider = GetForecasteWeatherEndpoint(model: model)
        let response = try await apiClient.asyncRequest(endpoint: endpoint, responseModel: GetForecasteWeatherResponse.self)
        return response
    }
    
}
