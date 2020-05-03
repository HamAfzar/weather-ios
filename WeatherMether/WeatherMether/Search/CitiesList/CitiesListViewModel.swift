//
//  CitiesListViewModel.swift
//  WeatherMether
//
//  Created by Sadegh on 2/12/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import SwiftUI

class CitiesListViewModel: ObservableObject {
    @Published var cities: [CityModel]?
}
