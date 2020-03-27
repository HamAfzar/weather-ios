//
//  HomeNavigationView.swift
//  WeatherMether
//
//  Created by Sadegh on 1/8/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import SwiftUI

struct HomeNavigationView<Content: View>: View {
    private let content: Content
    
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        NavigationView {
            content
                .navigationBarItems(
                    leading: Image("Home_DetailButton_ic"),
                    trailing: Image("Home_SearchButton_ic")
            )
        }
    }
}
