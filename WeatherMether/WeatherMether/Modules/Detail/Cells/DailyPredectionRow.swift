//
//  DailyPredectionRow.swift
//  WeatherMether
//
//  Created by Sadegh on 1/22/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import SwiftUI

struct DailyPredectionRow: View {
    var body: some View {
        BaseView {
            GeometryReader { geometry in
                ShadowedView(width: geometry.size.width, height: 136) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        HStack(alignment: .center, spacing: 0) {
                            ForEach(self.getDays(), id: \.self) { day in
                                VerticalImageAndTextView(topView: BaseText(text: day, font: Font.robotoMedium(14)),
                                                         bottomView: self.minAndMaxView,
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
    
    private var minAndMaxView: some View {
        HStack(alignment: .center, spacing: 4) {
            BaseText(text: "12°", font: Font.robotoBold(20))
            BaseText(text: "4°", font: Font.robotoBold(20), color: CustomColorName.lowerDegree.getColor)
        }
    }
    
    private func getDays() -> [String] {
        var days: [String] = []
        let calendar = Calendar(identifier: .gregorian)
        
        for index in 1...5 {
            guard let date = calendar.date(byAdding: .weekday, value: index, to: Date()) else { break }
            days.append(date.dayOfWeek)
        }
        return days
    }
}

struct DailyPredectionRow_Previews: PreviewProvider {
    static var previews: some View {
        DailyPredectionRow()
    }
}
