//
//  HourlyPredectionView.swift
//  WeatherMether
//
//  Created by Sadegh on 1/15/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import SwiftUI

struct HourlyPredectionRow: View {
    var hourly: [Forcast]?
    
    var body: some View {
        BaseView {
            GeometryReader { geometry in
                ShadowedView(width: geometry.size.width, height: 136) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(self.getHours(), id: \.self) { hour in
                                VerticalImageAndTextView(topView: self.getAttributedTime(text: hour),
                                                         bottomView: BaseText(text: "12°", font: Font.robotoBold(20)),
                                                         image: Image("ic_detail_rainyWeather_large"),
                                                         frame: CGRect(x: 0, y: 0, width: 20, height: 20)
                                )
                            }
                        }.frame(minWidth: 0, maxWidth: .infinity)
                        .padding([.leading, .top, .bottom, .trailing], 16)
                    }
                }
            }
        }
    }
    
    private func getAttributedTime(text: String) -> some View {
        let endIndex = text.endIndex
        let startIndex = text.index(text.endIndex, offsetBy: -2)
        var textView: some View {
            HStack(alignment: .bottom, spacing: 0) {
                if text == "Now" {
                    BaseText(text: text, font: Font.robotoBold(14))
                } else {
                    BaseText(text: String(text[text.startIndex..<startIndex]), font: Font.robotoMedium(14))
                    BaseText(text: String(text[startIndex..<endIndex]), font: Font.robotoMedium(12))
                }
            }
        }
        
        return textView
    }
    
    private func getHours() -> [String] {
        var stringHours: [String] = []
        let calendar = Calendar(identifier: .gregorian)
        stringHours.append("Now")
        
        for index in 1...5 {
            guard let newDate = calendar.date(byAdding: .hour, value: index * 3, to: Date()) else { break }
            stringHours.append(newDate.timeOfDate(dateFormat: "ha"))
        }
        return stringHours
    }
}

struct HourlyPredectionView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyPredectionRow()
    }
}
