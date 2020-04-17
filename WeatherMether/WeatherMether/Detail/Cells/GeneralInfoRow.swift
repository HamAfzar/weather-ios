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
                    
                    VerticalImageAndTextView(topView: self.mainInfoView,
                                             bottomView: self.detailView,
                                             image: nil,
                                             frame: CGRect.zero
                    )
                        .padding([.all], 12)
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
    }
    
    private var weatherIcon: some View {
        HorizontalImageAndTextView(view: BaseText(text: "Mostly Rainy", font: Font.robotoMedium(14)),
                                   image: Image("ic_detail_rainyWeather_large"),
                                   frame: CGRect(x: 0, y: 0, width: 52, height: 56)
        )
    }
    
    private var minAndMaxView: some View {
        HStack {
            BaseText(text: "12°", font: Font.robotoBold(60))
            BaseText(text: "4°", font: Font.robotoBold(60), color: CustomColorName.lowerDegree.getColor)
        }
    }
    
    private var detailView: some View {
        HStack {
            HorizontalImageAndTextView(view: BaseText(text: "76%", font: Font.robotoMedium(14)),
                                       image: Image("ic_detail_drop"),
                                       frame: CGRect(x: 0, y: 0, width: 12, height: 16)
            )
            
            Spacer()
            HorizontalImageAndTextView(view: BaseText(text: "11 Km/h", font: Font.robotoMedium(14)),
                                       image: Image("ic_winidyWeather"),
                                       frame: CGRect(x: 0, y: 0, width: 20, height: 16)
            )
            
            Spacer()
            HorizontalImageAndTextView(view: BaseText(text: "Low", font: Font.robotoMedium(14)),
                                       image: Image("ic_detail_sun"),
                                       frame: CGRect(x: 0, y: 0, width: 20, height: 20)
            )
            
        }.frame(minWidth: 0, maxWidth: .infinity)
    }
}

struct GeneralInfoRow_Previews: PreviewProvider {
    static var previews: some View {
        GeneralInfoRow()
    }
}
