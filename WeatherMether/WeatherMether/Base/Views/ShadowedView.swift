//
//  ShadowedView.swift
//  WeatherMether
//
//  Created by Sadegh on 1/7/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import SwiftUI

struct ShadowedView<Content>: View where Content: View {
    var width: CGFloat
    var height: CGFloat
    
    private let content: Content
    
    public init(width: CGFloat, height: CGFloat, @ViewBuilder content: () -> Content) {
        self.content = content()
        self.width = width
        self.height = height
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(CustomColorName.baseBackground.getColor)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            RoundedRectangle(cornerRadius: 7)
                .fill(CustomColorName.baseBackground.getColor)
                .frame(height: height)
                .shadow(color: CustomColorName.shadowedViewLightShadow.getColor, radius: 3, x: -5, y: -7)
                .shadow(color: CustomColorName.shadowedViewDarkShadow.getColor, radius: 3, x: 5, y: 7)
                .blur(radius: 0.1)
            
            content
        }
        .frame(width: width, height: height, alignment: .center)
    }
}
