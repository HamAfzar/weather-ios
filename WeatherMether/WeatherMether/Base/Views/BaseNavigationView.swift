//
//  HomeNavigationView.swift
//  WeatherMether
//
//  Created by Sadegh on 1/8/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import SwiftUI

struct BaseNavigationView<Content>: View where Content: View {
    private let content: Content
    
    public init(@ViewBuilder content: () -> Content) {
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().backgroundColor = .clear
        
        self.content = content()
    }
    
    var body: some View {
        NavigationView {
            content
                .navigationBarTitle("", displayMode: .inline)
        }
    }
}
