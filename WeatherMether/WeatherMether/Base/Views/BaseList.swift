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
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        List {
            content
        }
    }
}
