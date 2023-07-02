//
//  GetCurrentLocationUseCase.swift
//  OpenWeatherAppCore
//
//  Created by Rodrigo Torres on 02/07/2023.
//

import Foundation

public protocol GetCurrentLocationUseCaseType {
    func execute() async throws -> Location
}

public struct GetCurrentLocationUseCase: GetCurrentLocationUseCaseType {
    
    private let locationService: CurrentLocationService
    
    public init(locationService: CurrentLocationService = CoreLocationService()) {
        self.locationService = locationService
    }
    
    public func execute() async throws -> Location {
        return try await locationService.getCurrentLocation()
    }
    
}
