//
//  MainDetailView.swift
//  WeatherMether
//
//  Created by Sadegh on 1/15/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import SwiftUI

struct MainDetailView: View {
    var body: some View {
        BaseView {
            VStack {
                self.titleView
                self.detailList
            }
        }
    }
    
    private var titleView: some View {
        HStack {
            BaseText(text: "New York", font: Font.robotoBold(25))
            Spacer()
            BaseText(text: "Mon, 2 Dec", font: Font.robotoMedium(18))
        }.padding(EdgeInsets(top: 28, leading: 16, bottom: 0, trailing: 16))
    }
    
    private var detailList: some View {
        BaseList {
            GeneralInfoRow()
                .scaledToFill()
                .frame(height: 160)
                .clipped()
                .listRowInsets(EdgeInsets())
                .listRowBackground(CustomColorName.baseBackground.getColor)
            
            HourlyPredectionView()
                .scaledToFill()
                .frame(height: 160)
                .clipped()
                .listRowInsets(EdgeInsets())
                .listRowBackground(CustomColorName.baseBackground.getColor)
            
            GeneralInfoRow()
                .scaledToFill()
                .frame(height: 160)
                .clipped()
                .listRowInsets(EdgeInsets())
                .listRowBackground(CustomColorName.baseBackground.getColor)
            
            GeneralInfoRow()
                .scaledToFill()
                .frame(height: 160)
                .clipped()
                .listRowInsets(EdgeInsets())
                .listRowBackground(CustomColorName.baseBackground.getColor)
        }
    }
}

struct MainDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MainDetailView()
    }
}
