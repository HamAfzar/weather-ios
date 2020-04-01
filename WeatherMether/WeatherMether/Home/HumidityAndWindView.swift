//
//  HumidityAndWindView.swift
//  WeatherMether
//
//  Created by Sadegh on 1/9/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import SwiftUI

struct HumidityAndWindView: View {
    let width: CGFloat = 340
    
    private var middleLine: some View {
        GeometryReader { geometry in
            Path { path in
                let height = geometry.size.height
                let middle = geometry.size.width / 2
                let lineWidth: CGFloat = 2
                let halfOfLineWidth: CGFloat = lineWidth / 2
                
                path.move(to: CGPoint(x: middle, y: 0))
                path.addLines([
                    CGPoint(x: middle - halfOfLineWidth, y: 16),
                    CGPoint(x: middle - halfOfLineWidth, y: height - 16),
                    CGPoint(x: middle + halfOfLineWidth, y: height - 16),
                    CGPoint(x: middle + halfOfLineWidth, y: 16)
                ])
            }
            .fill(CustomColorName.baseText.getColor)
        }
    }
    
    private var windView: some View {
        VStack(alignment: .center, spacing: 8) {
            Image("ic_winidyWeather")
            BaseText(text: "11 Km/h", font: .robotoMedium(18))
        }
    }
    
    private var humidityView: some View {
        VStack(alignment: .center, spacing: 8) {
            Image("ic_home_drop")
            BaseText(text: "76 %", font: .robotoMedium(18))
        }
        
    }
    
    var body: some View {
        HStack {
            Spacer()
            self.windView
            
            Spacer()
            self.middleLine.frame(width: 2)
            Spacer()
            
            self.humidityView
            Spacer()
        }
    }
}

struct HumidityAndWindView_Previews: PreviewProvider {
    static var previews: some View {
        HumidityAndWindView().previewLayout(.fixed(width: 340, height: 108))
    }
}
