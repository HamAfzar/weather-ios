//
//  CitiesListView.swift
//  WeatherMether
//
//  Created by Sadegh on 2/12/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import SwiftUI

struct CitiesListView: View {
    
    @ObservedObject var viewModel: CitiesListViewModel
    
    init(cities: [CityModel]?, viewModel: CitiesListViewModel = CitiesListViewModel()) {
        self.viewModel = viewModel
        self.viewModel.cities = cities
    }
    var body: some View {
        BaseList(height: 60) {
            ForEach(self.$viewModel.cities.wrappedValue ?? [], id: \.id, content: { city in
                CitiesListCell(cityName: city.name ?? "")
            })
        }
    }
}
