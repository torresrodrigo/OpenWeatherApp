//
//  GetCurrentWeatherUseCase.swift
//  OpenWeatherAppCore
//
//  Created by Rodrigo Torres on 02/07/2023.
//

import Combine

public protocol GetCurrentWeatherUseCaseType {
    func execute() async throws
}

public class GetCurrentWeatherUseCase: GetCurrentWeatherUseCaseType {
    
    private var locationService: CoreLocationService = CoreLocationService()
    private let apiService: GetCurrentWeatherAPIDataSource
    private var cancellables = Set<AnyCancellable>()
    public var currentLocation = PassthroughSubject<GetCurrentWeatherResponse, Never>()
    
    public init(apiService: GetCurrentWeatherAPIDataSource = OpenWeatherCoreRemoteDataSource.shared.getCurrentWeather) {
        self.apiService = apiService
    }
    
    public func execute() async throws {
        locationService.start()
        locationService.$location
            .sink { [weak self] location in
                guard let self = self, let location = location else { return }
                self.locationService.stop()
                Task.detached(priority: .userInitiated) {
                    let response = try await self.apiService.execute(latitude: String(location.latitude), longitude: String(location.longitude))
                    self.currentLocation.send(response)
                }
            }.store(in: &cancellables)
    }
}
