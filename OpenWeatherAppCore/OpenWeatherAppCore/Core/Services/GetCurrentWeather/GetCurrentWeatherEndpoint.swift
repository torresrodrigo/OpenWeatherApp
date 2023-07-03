//
//  GetCurrentWeatherEndpoint.swift
//  OpenWeatherAppCore
//
//  Created by Rodrigo Torres on 02/07/2023.
//

import Foundation
import OpenWeatherNetwork

struct GetCurrentWeatherEndpoint: EndpointProvider {
    
    private let model: GetCurrentWeatherRequest
    
    init(model: GetCurrentWeatherRequest) {
        self.model = model
    }
    
    var scheme: String = {
        return OpenWeatherServiceManager.shared.getValue(key: Constants.scheme.value)
    }()
    
    var baseUrl: String = {
        return OpenWeatherServiceManager.shared.getValue(key: Constants.baseUrl.value)
    }()
    
    var path: String = {
        return OpenWeatherServiceManager.shared.getValue(key: Constants.currentWeatherPath.value)
    }()
    
    var method: RequestMethod = {
        return .get
    }()
    
    var queryItems: [URLQueryItem]? {
        let apiKey = OpenWeatherServiceManager.shared.getValue(key: Constants.apiKey.value)
        return [URLQueryItem(name: "lat", value: model.latitude),
                URLQueryItem(name: "lon", value: model.longitude),
                URLQueryItem(name: "units", value: model.units),
                URLQueryItem(name: "appid", value: apiKey),]
    }
    
    var mockFile: String?
    
}
