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
    //    @State private var haveLocationPermission: Bool?
    @Published var dataSource: WeatherModel?
    @Published var showLoading = false
    @Published var showHomeView = false
    @Published var showSearchView = false
    @Published var showError = false
    @Published var error: NetworkError?
    
    private var disposables = Set<AnyCancellable>()
    
    func initFunctions() {
        self.checkLocationPermission()
    }
    
    func checkIfLoocationCatched() {
        self.locationManager.startUpdateLocation()
        locationManager.$location.sink { [weak self] location in
            if let lat = self?.locationManager.location?.coordinate.latitude,
                let lon = self?.locationManager.location?.coordinate.longitude {
                self?.locationManager.stopUpdatingLocation()
                self?.provideData(location: (lat: lat, lon: lon))
            }}.store(in: &disposables)
    }
    
    func requestLocation() {
        self.locationManager.getLocationPermissionAfterATime(time: 1.0)
    }
    
    func checkLocationPermission() {
        self.showLoading = true
        locationManager.$status.sink { [weak self] status in
            guard let status = status else {
                self?.requestLocation()
                return
            }
            
            if status == .authorizedWhenInUse || status == .authorizedAlways {
                self?.checkIfLoocationCatched()
            } else if status == .denied {
                self?.showLoading = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    self?.showSearchView = true
                }
            }
        }.store(in: &disposables)
    }
    
    func provideData(location: (lat: Double, lon: Double)) {
        // we should use caching
        self.disposables.removeAll()
        requestData(location: (lat: location.lat, lon: location.lon))
    }
    
    func requestData(location: (lat: Double, lon: Double)) {
        let request: AnyPublisher<WeatherModel, NetworkError> = NetworkRequestAgent.run(APIRouter.getWeatherByLocation(lat: location.lat, lon: location.lon, unit: "metric"))
        request.sink(receiveCompletion: { [weak self] completion in
            switch completion {
            case .failure(let error):
                self?.showLoading = false
                self?.error = error
                self?.showError = true
            case .finished: break
            }
        }, receiveValue: { [weak self] weatherModel in
            self?.dataSource = weatherModel
            self?.showLoading = false
            self?.showHomeView = true
        }).store(in: &disposables)
    }
}
