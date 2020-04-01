//
//  ViewExtensions.swift
//  WeatherMether
//
//  Created by Sadegh on 1/13/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import SwiftUI

extension View {
    
    /// Navigate to a new view.
    /// - Parameters:
    ///   - view: View to navigate to.
    ///   - binding: Only navigates when this condition is `true`.
    func navigate<SomeView: View>(to view: SomeView, when binding: Binding<Bool>) -> some View {
        modifier(NavigateModifier(destination: view, binding: binding))
    }
}

// MARK: - NavigateModifier
struct NavigateModifier<SomeView: View>: ViewModifier {
    
    fileprivate let destination: SomeView
    @Binding fileprivate var binding: Bool
    
    // MARK: - View body
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
