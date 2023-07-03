//
//  EndpointProvider.swift
//  OpenWeatherNetwork
//
//  Created by Rodrigo Torres on 28/06/2023.
//

public protocol EndpointProvider {
    var scheme: String { get set }
    var baseUrl: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var queryItems: [URLQueryItem]? { get }
    var mockFile: String? { get }
}

extension EndpointProvider {
     
    var scheme: String {
        return "https"
    }
    
    var mockFile: String? {
        return nil
    }
    
    func asURLRequest() throws -> URLRequest {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = baseUrl
        urlComponents.path = path
        
        if let queryItems = queryItems {
            urlComponents.queryItems = queryItems
        }
        
        guard let url = urlComponents.url else {
            throw APIError(errorCode: "Error", message: "UrlError")
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("true", forHTTPHeaderField: "X-Use-Cache")
        
        return urlRequest
    }
}

