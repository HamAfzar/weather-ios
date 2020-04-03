//
//  GeneralInfoRow.swift
//  WeatherMether
//
//  Created by Sadegh on 1/14/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import SwiftUI

struct GeneralInfoRow: View {
    
    var body: some View {
        BaseView {
            GeometryReader { geometry in
                ShadowedView(width: geometry.size.width, height: 136) {
                    VStack(alignment: .center, spacing: 0) {
                        self.mainInfoView
                        Spacer()
                        self.detailView
                    }
                }
            }
        }
    }
    
    private var mainInfoView: some View {
        HStack {
            self.weatherIcon
            Spacer()
            self.minAndMaxView
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding(.top, 12)
    }
    
    private var weatherIcon: some View {
        HStack {
            self.getImageAndTextView(
                text: "Mostly Rainy",
                font: Font.robotoMedium(14),
                imageName: "ic_detail_rainyWeather_large"
            )
        } .padding(.leading, 20)
    }
    
    private var minAndMaxView: some View {
        HStack {
            BaseText(text: "12°", font: Font.robotoBold(60))
            BaseText(text: "4°", font: Font.robotoBold(60), color: CustomColorName.lowerDegree.getColor)
        }.padding(.trailing, 20)
    }
    
    private var detailView: some View {
        HStack {
            self.getImageAndTextView(
                text: "76%",
                font: Font.robotoMedium(14),
                imageName: "ic_detail_drop"
            )
            Spacer()
            
            self.getImageAndTextView(
                text: "11 Km/h",
                font: Font.robotoMedium(14),
                imageName: "ic_winidyWeather"
            )
            Spacer()
            
            self.getImageAndTextView(
                text: "Low",
                font: Font.robotoMedium(14),
                imageName: "ic_detail_sun"
            )
        }.frame(minWidth: 0, maxWidth: .infinity)
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 12, trailing: 20))
    }
}

struct GeneralInfoRow_Previews: PreviewProvider {
    static var previews: some View {
        GeneralInfoRow()
    }
}
