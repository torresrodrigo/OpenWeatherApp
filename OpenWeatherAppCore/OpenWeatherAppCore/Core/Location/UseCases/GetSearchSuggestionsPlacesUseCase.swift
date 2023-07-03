//
//  GetSearchSuggestionsPlacesUseCase.swift
//  OpenWeatherAppCore
//
//  Created by Rodrigo Torres on 02/07/2023.
//



protocol GetSearchSuggestionsPlacesUseCaseType {
    func execute(searchText: String) async throws -> [SuggestedPlace]
}

public struct GetSearchSuggestionsPlacesUseCase: GetSearchSuggestionsPlacesUseCaseType {
    
    private let locationService: LocationSearchServiceType
    
    public init(locationService: LocationSearchServiceType = AppleLocationSearchService()) {
        self.locationService = locationService
    }
    
    public func execute(searchText: String) async throws -> [SuggestedPlace] {
        return try await locationService.searchPlaces(query: searchText)
    }
}
