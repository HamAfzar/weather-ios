//
//  BaseHomeView.swift
//  WeatherMether
//
//  Created by Sadegh on 1/8/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import SwiftUI

struct BaseHomeView: View {
    var current: Current?
    
    private var cityNameAndDateView: some View {
        VStack(alignment: .center, spacing: 4) {
            BaseText(text: current?.city?.name ?? "New York", font: .robotoBold(29))
            BaseText(text: "Mon, 2 Dec", font: .robotoMedium(18))
        }
    }
    
    private var weatherPredictionView: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            HStack(alignment: .top, spacing: 8) {
                BaseText(text: "\(current?.stats?.temp ?? 0)", font: .robotoBold(60))
                BaseText(text: "°C", font: .roboto(33)).padding(.top, 8)
            }
            HStack(alignment: .center, spacing: 8) {
                Image(current?.stats?.iconID?.rawValue ?? "ic_rainyWeather")
                BaseText(text: current?.stats?.condition?.rawValue ?? "Raining", font: .robotoMedium(20))
            }
        }
    }
    
    var body: some View {
        BaseView {
            VStack {
                self.cityNameAndDateView
                    .padding(.top, 20)
                
                Spacer()
                self.weatherPredictionView
                
                Spacer()
                ShadowedView(width: 340, height: 108) {
                    HumidityAndWindView()
                }.padding(16)
            }
        }
    }
}

struct BaseHomeView_Previews: PreviewProvider {
    static var previews: some View {
        BaseHomeView()
    }
}
