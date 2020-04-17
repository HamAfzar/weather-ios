//
//  BaseView.swift
//  WeatherMether
//
//  Created by Sadegh on 1/7/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import SwiftUI

struct BaseView<Content>: View where Content: View {
    private let content: Content
    
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            CustomColorName.baseBackground.getColor.edgesIgnoringSafeArea(.all)
            content
        }
    }
}
