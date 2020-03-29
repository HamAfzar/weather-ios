//
//  ShadowedView.swift
//  WeatherMether
//
//  Created by Sadegh on 1/7/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import SwiftUI

struct ShadowedView<Content: View>: View {
    private let content: Content
    
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(CustomColorName.baseBackground.getColor)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            RoundedRectangle(cornerRadius: 20)
                .fill(CustomColorName.baseBackground.getColor)
                .frame(width: 300, height: 180)
                .shadow(color: Color("lightShadow"), radius: 8, x: -8, y: -8)
                .shadow(color: Color("darkShadow"), radius: 8, x: 8, y: 8)
            content
        }
    }
}
