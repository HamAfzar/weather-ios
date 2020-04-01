//
//  MainDetailView.swift
//  WeatherMether
//
//  Created by Sadegh on 1/12/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import SwiftUI

struct MainDetailView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Color.clear.frame(height: geometry.size.height / 4)
                ZStack {
                    CustomColorName.mainDetailView.getColor
                        .opacity(0.8)
                        .blur(radius: 7)
                }
            }
        }
    }
}

struct MainDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MainDetailView()
    }
}
