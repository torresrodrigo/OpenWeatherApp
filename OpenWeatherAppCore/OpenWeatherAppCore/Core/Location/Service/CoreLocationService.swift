//
//  CoreLocationService.swift
//  OpenWeatherAppCore
//
//  Created by Rodrigo Torres on 02/07/2023.
//

import CoreLocation
import Combine

public class CoreLocationService: NSObject, ObservableObject {
    private var locationManager: CLLocationManager = CLLocationManager()
    @Published var location: Location?
    
    public override init() {
        super.init()
        locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        locationManager.delegate = self
    }
    
    public func start() {
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    public func stop() {
        locationManager.stopUpdatingLocation()
    }
}

extension CoreLocationService: CLLocationManagerDelegate {
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let newLocation = locations.last else { return }
        let result = Location(latitude: newLocation.coordinate.latitude, longitude: newLocation.coordinate.longitude)
        location = result
        stop()
    }
    
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error: \(error)")
    }
}
