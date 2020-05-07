//
//  HumidityAndWindView.swift
//  WeatherMether
//
//  Created by Sadegh on 1/9/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import SwiftUI

struct HumidityAndWindView: View {
    var currentStats: CurrentStats?
    let width: CGFloat = 340
    
    var body: some View {
        HStack {
            if currentStats == nil {
                EmptyView()
            } else {
                Spacer()
                self.getWindView().frame(minWidth: 0, maxWidth: .infinity)
                
                Spacer()
                self.middleLine.frame(width: 2)
                Spacer()
                
                self.humidityView().frame(minWidth: 0, maxWidth: .infinity)
                Spacer()
            }
        }
    }
}

extension HumidityAndWindView {
    private func getWindSpeed() -> String {
        guard let windSpeed = currentStats?.windSpeed else {
            return ""
        }
        
        // this should change when we apply imperial format
        let windSpeedFormat = "Km/h"
        return "\(Int(windSpeed))" + " " + windSpeedFormat
    }
    
    private func getWindView() -> some View {
        let windSpeedImageName = "ic_winidyWeather"
        let windSpeed = getWindSpeed()
        return VStack(alignment: .center, spacing: 8) {
            Image(windSpeedImageName)
            BaseText(text: windSpeed, font: .robotoMedium(18))
        }
    }
    
    private func getHumidity() -> String {
        guard let humidity = currentStats?.humidity else {
            return ""
        }
        
        return "\(humidity)%"
    }
    
    private func humidityView() -> some View {
        let humidityImageName = "ic_home_drop"
        let humidity = getHumidity()
        
        return VStack(alignment: .center, spacing: 8) {
            Image(humidityImageName)
            BaseText(text: humidity, font: .robotoMedium(18))
        }
    }
}

extension HumidityAndWindView {
    private var middleLine: some View {
        GeometryReader { geometry in
            Path { path in
                let height = geometry.size.height
                let middle = geometry.size.width / 2
                let lineWidth: CGFloat = 2
                let halfOfLineWidth: CGFloat = lineWidth / 2
                
                path.move(to: CGPoint(x: middle, y: 0))
                path.addLines([
                    CGPoint(x: middle - halfOfLineWidth, y: 16),
                    CGPoint(x: middle - halfOfLineWidth, y: height - 16),
                    CGPoint(x: middle + halfOfLineWidth, y: height - 16),
                    CGPoint(x: middle + halfOfLineWidth, y: 16)
                ])
            }
            .fill(CustomColorName.baseText.getColor)
        }
    }
}

struct HumidityAndWindView_Previews: PreviewProvider {
    static var previews: some View {
        HumidityAndWindView().previewLayout(.fixed(width: 340, height: 108))
    }
}
