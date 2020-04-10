//
//  HourlyPredectionView.swift
//  WeatherMether
//
//  Created by Sadegh on 1/15/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import SwiftUI

struct HourlyPredectionView: View {
    
    var body: some View {
        BaseView {
            GeometryReader { geometry in
                ShadowedView(width: geometry.size.width, height: 136) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(self.getHours(), id: \.self) { hour in
                                self.getView(time: hour, imageName: "ic_detail_rainyWeather_large", degree: "12°")
                            }
                            
                        }.frame(minWidth: 0, maxWidth: .infinity)
                    }
                }
            }
        }
    }
    
    private func getView(time: String, imageName: String, degree: String) -> some View {
        var customView: some View {
            VStack {
                self.getAttributedTime(text: time)
                Spacer()
                Image(imageName)
                    .resizable()
                    .frame(width: 20, height: 20)
                Spacer()
                BaseText(text: degree, font: Font.robotoBold(20))
            }.padding([.leading, .trailing, .bottom, .top], 16)
        }
        
        return customView
    }
    
    private func getAttributedTime(text: String) -> some View {
        let endIndex = text.endIndex
        let startIndex = text.index(text.endIndex, offsetBy: -2)
        var textView: some View {
            HStack(alignment: .bottom, spacing: 0) {
                BaseText(text: String(text[text.startIndex..<startIndex]), font: Font.robotoMedium(14))
                BaseText(text: String(text[startIndex..<endIndex]), font: Font.robotoMedium(12))
            }
        }
        
        return textView
    }
    
    private func getHours() -> [String] {
        var stringHours: [String] = []
        let formatter = DateFormatter()
        let calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = "ha"
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        
        for index in 0...5 {
            guard let newDate = calendar.date(byAdding: .hour, value: index * 3, to: Date()) else { break }
            let newHour = formatter.string(from: newDate)
            stringHours.append(newHour)
        }
        
        return stringHours
    }
}

struct HourlyPredectionView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyPredectionView()
    }
}
