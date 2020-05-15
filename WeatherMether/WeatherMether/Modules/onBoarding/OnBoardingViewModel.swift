//
//  OnBoardingViewModel.swift
//  WeatherMether
//
//  Created by amirhosseinpy on 1/15/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class OnBoardingViewModel: ObservableObject {
    @ObservedObject private var locationManager = LocationManager()
    @Published var showHomeView = false
    @Published var showSearchView = false
    private var disposables = Set<AnyCancellable>()
    
    func initFunctions() {
        self.checkLocationPermission()
    }
    
    func haveCities() -> Bool {
        let userDefault = UserDefaultsAgent()
        guard let cities: [CityModel] = userDefault.getValue(key: .cities),
            cities.count > 0 else {
                return false
        }
        
        return true
    }
    
    func requestLocation() {
        self.locationManager.getLocationPermissionAfterATime(time: 1.0)
    }
    
    func checkLocationPermission() {
        locationManager.$status.sink { [weak self] status in
            guard let self = self else { return }
            
            guard let status = status else {
                self.requestLocation()
                return
            }
            
            if status == .authorizedWhenInUse || status == .authorizedAlways {
                self.showHomeView = true
            } else if status == .denied {
                self.handlePermissionDeniedState()
            }
        }.store(in: &disposables)
    }
    
    func handlePermissionDeniedState() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            if self.haveCities() {
                self.showHomeView = true
            } else {
                self.showSearchView = true
            }
        }
    }
    
}
