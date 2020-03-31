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
    
    var middleLine: some View {
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
    
    var body: some View {
        HStack {
            Text("Sadegh")
                .frame(width: ((self.width - 2) / 2))
            self.middleLine.frame(width: 2)
            Text("Sadegh")
                .frame(width: ((self.width - 2) / 2))
        }.edgesIgnoringSafeArea(.all)
    }
}

struct HumidityAndWindView_Previews: PreviewProvider {
    static var previews: some View {
        HumidityAndWindView().previewLayout(.fixed(width: 340, height: 108))
    }
}
