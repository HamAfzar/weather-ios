//
//  CitiesListCell.swift
//  WeatherMether
//
//  Created by Sadegh on 2/12/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import SwiftUI

struct CitiesListCell: View {
    var cityName: String
    
    var body: some View {
        HStack {
            Text(cityName).foregroundColor(.red)
                .padding(.leading, 40)
        }
    }
}
