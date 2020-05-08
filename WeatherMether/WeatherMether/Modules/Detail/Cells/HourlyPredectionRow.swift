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
                        self.getItemsView().frame(minWidth: 0, maxWidth: .infinity)
                            .padding([.leading, .top, .bottom, .trailing], 16)
                    }
                }
            }
        }
    }
}

extension HourlyPredectionRow {
    private func getItemsView() -> some View {
        return HStack {
            ForEach(hourly ?? [], id: \.self) { forcast in
                self.getItemView(forcast: forcast)
            }
        }
    }
    
    private func getItemView(forcast: Forcast) -> some View {
        let hour = getHour(time: forcast.time)
        let imageName = forcast.stats?.iconID?.rawValue ?? ""
        let temp = getTemp(temp: forcast.stats?.temp)
        let isCurrentForcast = forcast == hourly?[0]
        
        return VerticalImageAndTextView(
            topView: self.getAttributedTime(text: hour, isCurrent: isCurrentForcast),
            bottomView: BaseText(text: temp, font: Font.robotoBold(20)),
            image: Image(imageName),
            frame: CGRect(x: 0, y: 0, width: 20, height: 20))
    }
    
    private func getAttributedTime(text: String, isCurrent: Bool) -> some View {
        let endIndex = text.endIndex
        let startIndex = text.index(text.endIndex, offsetBy: -2)
        var textView: some View {
            HStack(alignment: .bottom, spacing: 0) {
                if isCurrent {
                    BaseText(text: "Now", font: Font.robotoBold(14))
                } else {
                    BaseText(text: String(text[text.startIndex..<startIndex]), font: Font.robotoMedium(14))
                    BaseText(text: String(text[startIndex..<endIndex]), font: Font.robotoMedium(12))
                }
            }
        }
        
        return textView
    }
    
    private func getHour(time: Double?) -> String {
        let dateManager = DateManager()
        
        return dateManager.formatTime(timeValue: time) ?? ""
    }
    
    private func getTemp(temp: Double?) -> String {
        guard let temp = temp else { return "" }
        
        return "\(Int(temp))°"
    }
}

struct HourlyPredectionView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyPredectionRow()
    }
}
