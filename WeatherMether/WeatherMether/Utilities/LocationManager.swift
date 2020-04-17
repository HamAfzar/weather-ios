//
//  LocationManager.swift
//  WeatherMether
//
//  Created by amirhosseinpy on 1/14/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import Foundation
import CoreLocation
import Combine

class LocationManager: NSObject, ObservableObject {
    private let locationManager = CLLocationManager()
    private let geocoder = CLGeocoder()
    let objectWillChange = PassthroughSubject<Void, Never>()
    
    @Published var status: CLAuthorizationStatus? {
        willSet { objectWillChange.send() }
    }
    
    @Published var location: CLLocation? {
        willSet { objectWillChange.send() }
    }
    
    @Published var placemark: CLPlacemark? {
      willSet { objectWillChange.send() }
    }
    
    override init() {
        super.init()
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func stopUpdatingLocation() {
        self.locationManager.stopUpdatingLocation()
    }
    
    func requestLocationAccess() {
        self.locationManager.requestWhenInUseAuthorization()
    }
    
    func startUpdateLocation() {
        self.locationManager.startUpdatingLocation()
    }
    
    func getLocationPermissionAfterATime(time: Double) {
        DispatchQueue.main.asyncAfter(deadline: .now() + time) {
            self.requestLocationAccess()
            self.startUpdateLocation()
        }
    }
    
    private func geocode() {
      guard let location = self.location else { return }
      geocoder.reverseGeocodeLocation(location, completionHandler: { (places, error) in
        if error == nil {
          self.placemark = places?[0]
        } else {
          self.placemark = nil
        }
      })
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        self.status = status
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.location = location
        self.geocode()
    }
}
