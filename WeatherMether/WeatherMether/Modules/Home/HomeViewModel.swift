//
//  HomeViewModel.swift
//  WeatherMether
//
//  Created by amirhosseinpy on 2/5/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    @ObservedObject private var locationManager = LocationManager()
    @Published var dataSource: [WeatherModel] = []
    @Published var error: NetworkError?
    
    private var disposables = Set<AnyCancellable>()
}

extension HomeViewModel {
    func checkLocationPermission() {
        locationManager.$status.sink { [weak self] status in
            guard let status = status else {
                self?.locationManager.startUpdateLocation()
                return
            }
            
            if status == .authorizedWhenInUse || status == .authorizedAlways {
                self?.checkIfLocationCatched()
            } else if status == .denied {
                
            }
              
        }.store(in: &disposables)
    }
    
    private func checkIfLocationCatched() {
        self.locationManager.startUpdateLocation()
        locationManager.$location.sink { [weak self] location in
            guard let self = self else { return }
            
            if let lat = self.locationManager.location?.coordinate.latitude,
                let lon = self.locationManager.location?.coordinate.longitude {
                self.locationManager.stopUpdatingLocation()
                self.provideData(location: (lat, lon))
            }}.store(in: &disposables)
    }
    
    func getCities() -> [CityModel] {
        let userDefault = UserDefaultsAgent()
        guard let cities: [CityModel] = userDefault.getValue(key: .cities) else {
                return []
        }
        
        return cities
    }
    
    func provideData(location: (lat: Double, lon: Double)? = nil) {
        if let location = location {
            self.disposables.removeAll()
            requestByLocation(location: (lat: location.lat, lon: location.lon))
        } else {
            requestByCityId(cityIds: getCities().map { $0.id ?? 0 })
        }
        
        // we should use caching
        
    }
    
    func requestByLocation(location: (lat: Double, lon: Double)) {
        let router = APIRouter
            .getWeatherByLocation(lat: location.lat,
                                  lon: location.lon,
                                  unit: Unit.metric.rawValue)
        requestData(apiRouter: router)
    }
    
    func requestByCityId(cityIds: [Int]) {
        for cityId in cityIds {
            let router = APIRouter.getWeatherById(cityId: cityId, unit: Unit.metric.rawValue)
            requestData(apiRouter: router)
        }
    }
    
    func requestData(apiRouter: APIRouter) {
         let request: AnyPublisher<WeatherModel, NetworkError> = NetworkRequestAgent
                    .run(apiRouter)
                request.sink(receiveCompletion: { [weak self] completion in
                    switch completion {
                    case .failure(let error):
                        self?.error = error
                    case .finished: break
                    }
                }, receiveValue: { [weak self] weatherModel in
                    self?.dataSource.append(weatherModel)
                }).store(in: &disposables)
    }
}

extension HomeViewModel {
    enum Unit: String {
        case metric
        case imperial
    }
}
