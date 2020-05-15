//
//  HorizontalImageAndTextView.swift
//  WeatherMether
//
//  Created by Sadegh on 1/27/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import SwiftUI

struct HorizontalImageAndTextView<CustomView>: View where CustomView: View {
    var view: CustomView
    var image: Image?
    var frame: CGRect
    
    var body: some View {
        HStack {
            image?
                .resizable().scaledToFit()
                .frame(width: self.frame.width, height: self.frame.height)
            view
        }
    }
}
