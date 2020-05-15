//
//  DailyPredectionRow.swift
//  WeatherMether
//
//  Created by Sadegh on 1/22/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import SwiftUI

struct DailyPredectionRow: View {
    var daily: [Forcast]?
    
    var body: some View {
        BaseView {
            GeometryReader { geometry in
                ShadowedView(width: geometry.size.width, height: 136) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        self.getItemsView()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding([.leading, .top, .bottom, .trailing], 16)
                    }
                }
            }
        }
    }
}

extension DailyPredectionRow {
    private func getItemsView() -> some View {
        HStack(alignment: .center, spacing: 0) {
            ForEach(self.daily ?? [], id: \.self) { forcast in
                self.getItemView(forcast: forcast)
            }
        }
    }
    
    private func getItemView(forcast: Forcast) -> some View {
        let dayOfWeek = DateManager().formatDayOfWeek(timeValue: forcast.time) ?? ""
        let imageName = forcast.stats?.iconID?.rawValue ?? ""
        
        return VerticalImageAndTextView(
            topView: BaseText(text: dayOfWeek, font: Font.robotoMedium(14)),
            bottomView: self.minAndMaxView(stats: forcast.stats),
            image: Image(imageName),
            frame: CGRect(x: 0, y: 0, width: 28, height: 28))
    }
    
    private func minAndMaxView(stats: ForcastStats?) -> some View {
        let minTemp = getMinTemp(minTemp: stats?.tempMin)
        let maxTemp = getMaxTemp(maxTemp: stats?.tempMax)
        
        return HStack(alignment: .center, spacing: 4) {
            BaseText(text: maxTemp, font: Font.robotoBold(20))
            BaseText(text: minTemp, font: Font.robotoBold(20), color: CustomColorName.lowerDegree.getColor)
        }
    }
    
    private func getMinTemp(minTemp: Int?) -> String {
        guard let minTemp = minTemp else { return "" }
        
        return "\(minTemp)°"
    }
    
    private func getMaxTemp(maxTemp: Int?) -> String {
        guard let maxTemp = maxTemp else { return "" }
        
        return "\(maxTemp)°"
    }
}

struct DailyPredectionRow_Previews: PreviewProvider {
    static var previews: some View {
        DailyPredectionRow()
    }
}
