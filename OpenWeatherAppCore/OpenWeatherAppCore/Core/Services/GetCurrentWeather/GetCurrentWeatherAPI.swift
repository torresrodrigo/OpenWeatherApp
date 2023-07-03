//
//  GetCurrentWeatherAPI.swift
//  OpenWeatherAppCore
//
//  Created by Rodrigo Torres on 02/07/2023.
//

import OpenWeatherNetwork

public protocol GetCurrentWeatherAPIDataSource {
    func execute(latitude: String, longitude: String) async throws -> GetCurrentWeatherResponse
}

class GetCurrentWeatherAPI: GetCurrentWeatherAPIDataSource {
    
    private let apiClient: APIClientProtocol
    
    public init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
    }
    
    public func execute(latitude: String, longitude: String) async throws -> GetCurrentWeatherResponse {
        let model: GetCurrentWeatherRequest = GetCurrentWeatherRequest(latitude: latitude,
                                                                       longitude: longitude)
        let endpoint: EndpointProvider = GetCurrentWeatherEndpoint(model: model)
        let response = try await  apiClient.asyncRequest(endpoint: endpoint, responseModel: GetCurrentWeatherResponse.self)
        return response
    }
}
