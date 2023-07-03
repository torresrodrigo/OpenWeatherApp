//
//  GetForecasteWeatherEndpoint.swift
//  OpenWeatherAppCore
//
//  Created by Rodrigo Torres on 02/07/2023.
//

import OpenWeatherNetwork

struct GetForecasteWeatherEndpoint: EndpointProvider {
    
    let model: GetForecasteWeatherRequest
    
    init(model: GetForecasteWeatherRequest) {
        self.model = model
    }
    
    var scheme: String = {
        return OpenWeatherServiceManager.shared.getValue(key: Constants.scheme.value)
    }()
    
    var baseUrl: String = {
        return OpenWeatherServiceManager.shared.getValue(key: Constants.baseUrl.value)
    }()
    
    var path: String = {
        return OpenWeatherServiceManager.shared.getValue(key: Constants.forecastWeatherPath.value)
    }()
    
    var method: OpenWeatherNetwork.RequestMethod = {
        return .get
    }()
    
    var queryItems: [URLQueryItem]?  {
        let apiKey = OpenWeatherServiceManager.shared.getValue(key: Constants.apiKey.value)
        return [URLQueryItem(name: "lat", value: model.latitude),
                URLQueryItem(name: "lon", value: model.longitude),
                URLQueryItem(name: "units", value: model.units),
                URLQueryItem(name: "appid", value: apiKey),]
    }
    
    var mockFile: String?
    
    
}
