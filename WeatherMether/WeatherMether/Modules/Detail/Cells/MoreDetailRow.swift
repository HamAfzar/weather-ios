//
//  MoreDetailRow.swift
//  WeatherMether
//
//  Created by Sadegh on 1/22/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import SwiftUI

struct MoreDetailRow: View {
    var current: Current?
    
    var body: some View {
        BaseView {
            GeometryReader { geometry in
                ShadowedView(width: geometry.size.width, height: 136) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .center, spacing: 8) {
                            self.sunsetView()
                            
                            self.sunriseView()
                            
                            self.feelsLikeView()
                        }.frame(minWidth: 0, maxWidth: .infinity)
                            .padding([.leading, .top, .bottom, .trailing], 16)
                    }
                }
            }
        }
    }
}

extension MoreDetailRow {
    private func sunsetView() -> some View {
        let sunset = DateManager().formatFullTime12Hours(timeValue: current?.city?.sunset) ?? ""
        
        return VerticalImageAndTextView(topView: BaseText(text: "Sunset", font: Font.robotoMedium(14)),
                                        bottomView: self.timeView(text: sunset),
                                        image: Image(ImageRefrences.sunset.getImageName),
                                        frame: CGRect(x: 0, y: 0, width: 36, height: 28))
    }
    
    private func sunriseView() -> some View {
        let sunrise = DateManager().formatFullTime12Hours(timeValue: current?.city?.sunrise) ?? ""
        
        return VerticalImageAndTextView(
            topView: BaseText(text: "Sunrise", font: Font.robotoMedium(14)),
            bottomView: self.timeView(text: sunrise),
            image: Image(ImageRefrences.sunRise.getImageName),
            frame: CGRect(x: 0, y: 0, width: 36, height: 28))
    }
    
    private func feelsLikeView() -> some View {
        let feelsLikeTemp = feelsLike(temp: current?.stats?.feelsLike) ?? ""
        
        return VerticalImageAndTextView(
            topView: BaseText(text: "Feels Like", font: Font.robotoMedium(14)),
            bottomView: BaseText(text: feelsLikeTemp, font: Font.robotoMedium(14)),
            image: Image(ImageRefrences.feelsLike.getImageName),
            frame: CGRect(x: 0, y: 0, width: 20, height: 24))
    }
    
    private func feelsLike(temp: Int?) -> String? {
        guard let feelsLike = temp else { return "" }
        
        return "\(feelsLike)°"
    }
    
    private func timeView(text: String) -> some View {
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
}

struct MoreDetailRow_Previews: PreviewProvider {
    static var previews: some View {
        MoreDetailRow()
    }
}
