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
    @Published var dataSource: WeatherModel?
    @Published var showLoading = false
    @Published var showHomeView = false
    @Published var showSearchView = false
    @Published var error: NetworkError?
    
    //    @State var locationPermissionState = false
    func initFunctions() {
        requestLocation()
        self.showLoading = true
        if let havePermission = haveLocationPermission() {
            if havePermission {
                self.provideData()
            } else {
                self.showLoading = false
                self.showSearchView = true
            }
        }
    }
    
    func requestLocation() {
        self.locationManager.getLocationPermissionAfterATime(time: 1.0)
    }
    
    func haveLocationPermission() -> Bool? {
        if let status = locationManager.status {
            if status == .authorizedWhenInUse || status == .authorizedAlways {
                return true
            } else {
                return false
            }
        }
        return nil
    }
    
    func provideData() {
        requestData()
    }
    
    func requestData() {
        let request: AnyPublisher<WeatherModel, NetworkError> = NetworkRequestAgent.run(APIRouter.getWeather)
        request.sink(receiveCompletion: { completion in
            switch completion {
            case .failure(let error):
                self.error = error
            case .finished: break
            }
        }, receiveValue: { [weak self] weatherModel in
            self?.dataSource = weatherModel
        })
    }
}
