//
//  CoreSearchLocationService.swift
//  OpenWeatherAppCore
//
//  Created by Rodrigo Torres on 02/07/2023.
//

import MapKit

public protocol LocationSearchServiceType {
    func searchPlaces(query: String) async throws -> [SuggestedPlace]
}

public struct AppleLocationSearchService: LocationSearchServiceType {
    
    public init(){}
    
    public func searchPlaces(query: String) async throws -> [SuggestedPlace] {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        let search = MKLocalSearch(request: request)
        let response = try await search.start()
        
        return response.mapItems.map {
            SuggestedPlace(name: $0.name ?? "No name", latitude: $0.placemark.coordinate.latitude, longitude: $0.placemark.coordinate.longitude)
        }
    }
}
