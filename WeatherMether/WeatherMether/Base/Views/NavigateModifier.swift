//
//  NavigateModifier.swift
//  WeatherMether
//
//  Created by Sadegh on 1/13/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import SwiftUI

struct NavigateModifier<SomeView>: ViewModifier where SomeView: View {
    
    let destination: SomeView
    @Binding var binding: Bool
    
    func body(content: Content) -> some View {
        BaseNavigationView {
            ZStack {
                content
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                NavigationLink(destination: destination
                    .navigationBarTitle("")
                    .navigationBarHidden(true),
                               isActive: $binding) {
                                EmptyView()
                }
            }
        }
    }
}
