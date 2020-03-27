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
        ZStack{
            RoundedRectangle(cornerRadius: 7)
                .foregroundColor(CustomColorName.baseBackground.getColor())
                
                .shadow(color: CustomColorName.shadowedViewShadow.getColor(), radius: 7, x: -5, y: -7)
                .blur(radius: 1)
                .border(CustomColorName.shadowedViewShadow.getColor())
                
                .frame(height: 108)
            content
        }
    }
}
