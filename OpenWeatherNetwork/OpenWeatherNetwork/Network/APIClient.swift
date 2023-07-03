//
//  APIClient.swift
//  OpenWeatherNetwork
//
//  Created by Rodrigo Torres on 28/06/2023.
//

public protocol APIClientProtocol {
    func asyncRequest<T: Decodable>(endpoint: EndpointProvider, responseModel: T.Type) async throws -> T
}

final public class APIClient: APIClientProtocol {
    
    public init() {}
    
    private var session: URLSession {
        let configuration: URLSessionConfiguration = URLSessionConfiguration.default
        configuration.waitsForConnectivity = true
        configuration.timeoutIntervalForRequest = 60
        configuration.timeoutIntervalForResource = 300
        return URLSession(configuration: configuration)
    }
    
    public func asyncRequest<T: Decodable>(endpoint: EndpointProvider, responseModel: T.Type) async throws -> T {
        do {
            let (data, response) = try await session.data(for: endpoint.asURLRequest())
            return try self.manageResponse(data: data, response: response)
        } catch let error as APIError {
            throw error
        }
    }
    
    
    private func manageResponse<T: Decodable>(data: Data, response: URLResponse) throws -> T {
        guard let response = response as? HTTPURLResponse else {
            throw APIError(errorCode: "Error", message: "Invalid HTTP Response")
        }
        
        switch response.statusCode {
        case 200...400:
            do {
                let decoder: JSONDecoder = JSONDecoder()
                decoder.dateDecodingStrategy = .secondsSince1970
                return try decoder.decode(T.self, from: data)
            } catch {
                print("LOGError", error)
                throw APIError(errorCode: "Error",
                               message: "Error decoding data")
            }
        default:
            guard let decodedError = try? JSONDecoder().decode(APIError.self, from: data) else {
                throw APIError(errorCode: "Error",
                               message: "Unknown backend error")
            }
            
            throw APIError(errorCode: decodedError.errorCode,
                           message: decodedError.message)
        }
    }
    
    
}
