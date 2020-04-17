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
    
    func getHorizontalImageAndTextView(text: String, font: Font, imageName: String) -> some View {
        var customView: some View {
            HStack {
                Image(imageName)
                BaseText(text: text, font: font)
            }
        }
        
        return customView
    }
}
