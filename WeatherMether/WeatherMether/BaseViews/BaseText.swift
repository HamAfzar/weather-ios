//
//  BaseText.swift
//  WeatherMether
//
//  Created by Sadegh on 1/8/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import SwiftUI

struct BaseText: View {
    var text: String
    var font: Font
    var color: Color = CustomColorName.baseText.getColor()
    
    var body: some View {
        Text(self.text)
            .font(self.font)
            .foregroundColor(self.color)
    }
}
