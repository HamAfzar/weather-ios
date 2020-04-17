//
//  BaseList.swift
//  WeatherMether
//
//  Created by Sadegh on 1/15/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import SwiftUI

struct BaseList<Content>: View where Content: View {
    private let content: Content
    var height: CGFloat

    init(height: CGFloat, @ViewBuilder content: () -> Content) {
        self.content = content()
        UITableView.appearance().separatorStyle = .none
        
        self.height = height
    }
    
    var body: some View {
        List {
            content
                .scaledToFill()
                .frame(height: self.height)
                .clipped()
                .listRowInsets(EdgeInsets())
                .listRowBackground(CustomColorName.baseBackground.getColor)
        }
    }
}
