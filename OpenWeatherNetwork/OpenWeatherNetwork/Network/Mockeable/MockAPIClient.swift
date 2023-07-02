//
//  MockAPIClient.swift
//  OpenWeatherNetwork
//
//  Created by Rodrigo Torres on 28/06/2023.
//

public final class MockAPIClient: Mockable, APIClientProtocol {
    public func asyncRequest<T>(endpoint: EndpointProvider, responseModel: T.Type) async throws -> T where T : Decodable {
        return loadJSON(filename: endpoint.mockFile!, type: responseModel.self)
    }
}
