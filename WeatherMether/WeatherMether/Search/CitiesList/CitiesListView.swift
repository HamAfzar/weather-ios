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
    @Binding var searchedLocation: String
    
    init(cities: [CityModel]?, viewModel: CitiesListViewModel = CitiesListViewModel(), searchedLocation: Binding<String>) {
        self.viewModel = viewModel
        self._searchedLocation = searchedLocation
        self.viewModel.cities = cities
    }
    
    var body: some View {
        ZStack {
            CustomColorName.mainDetailView.getColor
                .opacity(0.1)
                .contrast(-2)
            VisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterialLight))
            
            BaseList(height: 60, cellColor: Color.clear) {
                ForEach(self.$viewModel.cities.wrappedValue ?? [], id: \.id, content: { city in
                    CitiesListCell(cityName: city.name ?? "", searchedLocation: self.$searchedLocation)
                })
            }
        }
    }
}
