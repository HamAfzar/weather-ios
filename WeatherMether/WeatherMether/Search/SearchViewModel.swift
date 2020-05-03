//
//  SearchViewModel.swift
//  WeatherMether
//
//  Created by Sadegh on 2/12/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class SearchViewModel: ObservableObject {
    @Published var dataSource: [CityModel]?
    @Published var showLoading = false
    @Published var showSearchView = false
    @Published var showError = false
    @Published var error: NetworkError?
    @Binding var showView: Bool
    
    private lazy var disposables = Set<AnyCancellable>()
    
    init(showView: Binding<Bool>) {
        self._showView = showView
    }
    
    internal func getCities(city name: String) {
        let request: AnyPublisher<[CityModel], NetworkError> = NetworkRequestAgent.run(.getCityByNameQuery(name: name))
        request.sink(receiveCompletion: { [weak self] completion in
            switch completion {
            case .failure(let error):
                self?.error = error
                self?.showError = true
                self?.showLoading = false
            case .finished: break
            }
            }, receiveValue: { [weak self] cityModel in
                self?.dataSource = cityModel
                self?.showLoading = false
            }
        ).store(in: &disposables)
    }
}
