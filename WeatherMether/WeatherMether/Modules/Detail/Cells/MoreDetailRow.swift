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
                        HStack {
                            VerticalImageAndTextView(topView: BaseText(text: "Sunset", font: Font.robotoMedium(14)),
                                                     bottomView: self.timeView(text: "7:19PM"),
                                                     image: Image(ImageRefrences.sunset.getImageName),
                                                     frame: CGRect(x: 0, y: 0, width: 36, height: 28)
                            )
                            
                            VerticalImageAndTextView(topView: BaseText(text: "Sunrise", font: Font.robotoMedium(14)),
                                                     bottomView: self.timeView(text: "6:59AM"),
                                                     image: Image(ImageRefrences.sunRise.getImageName),
                                                     frame: CGRect(x: 0, y: 0, width: 36, height: 28)
                            )
                            
                            VerticalImageAndTextView(topView: BaseText(text: "Feels Like", font: Font.robotoMedium(14)),
                                                     bottomView: BaseText(text: "12°", font: Font.robotoMedium(14)),
                                                     image: Image(ImageRefrences.feelsLike.getImageName),
                                                     frame: CGRect(x: 0, y: 0, width: 20, height: 24)
                            )
                            
                            VerticalImageAndTextView(topView: BaseText(text: "Chance Of Rain", font: Font.robotoMedium(14)),
                                                     bottomView: BaseText(text: "76%", font: Font.robotoMedium(14)),
                                                     image: Image(ImageRefrences.chanceOfRain.getImageName),
                                                     frame: CGRect(x: 0, y: 0, width: 24, height: 28)
                            )
                        }.frame(minWidth: 0, maxWidth: .infinity)
                            .padding([.leading, .top, .bottom, .trailing], 16)
                    }
                }
            }
        }
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
