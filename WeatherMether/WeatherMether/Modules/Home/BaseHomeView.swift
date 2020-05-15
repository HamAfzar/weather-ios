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
    let dateManager = DateManager()
    
    var body: some View {
        BaseView {
            VStack {
                VStack(alignment: .center, spacing: 4) {
                    getCityView()
                    getDateView()
                }.padding(.top, 20)
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 8) {
                    getTempView()
                    getConditionView()
                }
                
                Spacer()
                ShadowedView(width: 340, height: 108) {
                    HumidityAndWindView(currentStats: current?.stats)
                }.padding(16)
            }
        }
    }
}

extension BaseHomeView {
    private func getDateView() -> some View {
        let time = current?.time
        let dateWithFormat = dateManager.formatDate(timeValue: time) ?? ""
        return BaseText(text: dateWithFormat, font: .robotoMedium(18))
    }
    
    private func getCityView() -> some View {
        let cityName =  current?.city?.name ?? ""
        return BaseText(text: cityName, font: .robotoBold(29))
    }
    
    private func getTemp() -> String {
        guard let temp = current?.stats?.temp else { return "" }
        return "\(temp)"
    }
    
    private func getDegree() -> String {
        guard current?.stats?.temp != nil else { return "" }
        return "°C" // this should change when we apply imperial format
    }
    
    private func getTempView() -> some View {
        HStack(alignment: .top, spacing: 8) {
            BaseText(text: getTemp(), font: .robotoBold(60))
            BaseText(text: getDegree(), font: .roboto(33)).padding(.top, 8)
        }
    }
    
    private func getConditionView() -> some View {
        let conditionImageId = current?.stats?.iconID?.rawValue ?? ""
        let condition = current?.stats?.condition?.rawValue ?? ""
        return HStack(alignment: .center, spacing: 8) {
            Image(conditionImageId)
            BaseText(text: condition, font: .robotoMedium(20))
        }
    }
}

struct BaseHomeView_Previews: PreviewProvider {
    static var previews: some View {
        BaseHomeView()
    }
}
