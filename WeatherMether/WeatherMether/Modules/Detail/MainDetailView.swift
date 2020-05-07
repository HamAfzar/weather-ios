//
//  MainDetailView.swift
//  WeatherMether
//
//  Created by Sadegh on 1/15/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import SwiftUI

struct MainDetailView: View {
    var weatherModel: WeatherModel?
    
    var body: some View {
        BaseView {
            VStack {
                getTitleView()
                self.detailList
            }
        }
    }
    
    private var detailList: some View {
        BaseList(height: 160) {
            GeneralInfoRow(currentStats: weatherModel?.current?.stats)
            
            HourlyPredectionRow(hourly: weatherModel?.hourly)
            
            DailyPredectionRow(daily: weatherModel?.daily)
            
            MoreDetailRow(current: weatherModel?.current)
        }
    }
}

extension MainDetailView {
    func getTitleView() -> some View {
        let cityName = weatherModel?.current?.city?.name ?? ""
        let date = DateManager().formatDate(timeValue: weatherModel?.current?.time) ?? ""
        
        return HStack {
            BaseText(text: cityName, font: Font.robotoBold(25))
            Spacer()
            BaseText(text: date, font: Font.robotoMedium(18))
        }.padding(EdgeInsets(top: 28, leading: 16, bottom: 0, trailing: 16))
    }
}

struct MainDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MainDetailView()
    }
}
