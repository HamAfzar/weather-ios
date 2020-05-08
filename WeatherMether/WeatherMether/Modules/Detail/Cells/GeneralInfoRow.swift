//
//  GeneralInfoRow.swift
//  WeatherMether
//
//  Created by Sadegh on 1/14/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import SwiftUI

struct GeneralInfoRow: View {
    var currentStats: CurrentStats?
    
    var body: some View {
        BaseView {
            GeometryReader { geometry in
                ShadowedView(width: geometry.size.width, height: 136) {
                    
                    VerticalImageAndTextView(
                        topView: self.mainInfoView,
                        bottomView: self.detailView,
                        image: nil,
                        frame: CGRect.zero)
                        .padding([.all], 12)
                }
            }
        }
    }
}

extension GeneralInfoRow {
    private func getCurrentWeatherStatView() -> some View {
        let currentImageName = currentStats?.iconID?.rawValue ?? ""
        let currentCondition = currentStats?.condition?.rawValue ?? ""
        let baseTextView = BaseText(text: currentCondition, font: Font.robotoMedium(14))
        
        return HorizontalImageAndTextView(
            view: baseTextView,
            image: Image(currentImageName),
            frame: CGRect(x: 0, y: 0, width: 52, height: 56))
    }
    
    private func getHumidity() -> String {
        guard let humidity = currentStats?.humidity else {
            return ""
        }
        
        return "\(humidity)%"
    }
    
    private func getHumidityView() -> some View {
        let humidityIconName = "ic_detail_drop"
        let baseTextView = BaseText(text: getHumidity(), font: Font.robotoMedium(14))
        
        return HorizontalImageAndTextView(
            view: baseTextView,
            image: Image(humidityIconName),
            frame: CGRect(x: 0, y: 0, width: 12, height: 16))
    }
    
    private func getWindSpeed() -> String {
        guard let windSpeed = currentStats?.windSpeed else {
            return ""
        }
        
        // this should change when we apply imperial format
        let windSpeedFormat = "Km/h"
        return "\(Int(windSpeed))" + " " + windSpeedFormat
    }
    
    private func getWindSpeedView() -> some View {
        let windSpeedImageName = "ic_winidyWeather"
        let baseTextView = BaseText(text: getWindSpeed(), font: Font.robotoMedium(14))
        
        return HorizontalImageAndTextView(
            view: baseTextView,
            image: Image(windSpeedImageName),
            frame: CGRect(x: 0, y: 0, width: 20, height: 16))
    }
    
    private func getUVView() -> some View {
        let uvImageName = "ic_detail_sun"
        let uvState = currentStats?.uv?.getProperString() ?? ""
        let baseTextView = BaseText(text: uvState, font: Font.robotoMedium(14))
        
        return HorizontalImageAndTextView(
            view: baseTextView,
            image: Image(uvImageName),
            frame: CGRect(x: 0, y: 0, width: 20, height: 20))
    }
    
    func getMinTemp() -> String {
        guard let min = currentStats?.tempMin else { return ""}
        
        return "\(min)°"
    }
    
    func getMaxTemp() -> String {
        guard let max = currentStats?.tempMax else { return ""}
        
        return "\(max)°"
    }
    
    private func getMinMaxTempView() -> some View {
        return HStack {
            BaseText(text: getMaxTemp(), font: Font.robotoBold(60))
            BaseText(text: getMinTemp(), font: Font.robotoBold(60), color: CustomColorName.lowerDegree.getColor)
        }
    }
    
    private var mainInfoView: some View {
        HStack {
            self.getCurrentWeatherStatView()
            Spacer()
            getMinMaxTempView()
        }
        .frame(minWidth: 0, maxWidth: .infinity)
    }
    
    private var detailView: some View {
        HStack {
            getHumidityView()
            
            Spacer()
            getWindSpeedView()
            
            Spacer()
            getUVView()
            
        }.frame(minWidth: 0, maxWidth: .infinity)
    }
}

struct GeneralInfoRow_Previews: PreviewProvider {
    static var previews: some View {
        GeneralInfoRow()
    }
}
