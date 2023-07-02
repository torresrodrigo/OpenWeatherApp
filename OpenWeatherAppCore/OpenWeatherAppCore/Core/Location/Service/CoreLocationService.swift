//
//  CoreLocationService.swift
//  OpenWeatherAppCore
//
//  Created by Rodrigo Torres on 02/07/2023.
//

import CoreLocation

public protocol CurrentLocationService {
    func getCurrentLocation() async throws -> Location
}

public class CoreLocationService: NSObject, CurrentLocationService, CLLocationManagerDelegate {
    private let locationManager: CLLocationManager
    private var currentRequest: CheckedContinuation<Location, Error>?
    
    public init(locationManager: CLLocationManager = CLLocationManager()) {
        self.locationManager = locationManager
    }
    
    public func getCurrentLocation() async throws -> Location {
        return try await withCheckedThrowingContinuation { continuation in
            self.currentRequest = continuation
            self.locationManager.requestLocation()
        }
    }

    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {  return }
        let result = Location(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        currentRequest?.resume(returning: result)
        currentRequest = nil
    }
    
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        currentRequest?.resume(throwing: error)
        currentRequest = nil
    }
    
}
