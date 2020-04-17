//
//  VerticalImageAndTextView.swift
//  WeatherMether
//
//  Created by Sadegh on 1/22/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import SwiftUI

struct VerticalImageAndTextView<TopView, BottomView>: View where TopView: View, BottomView: View {
    var topView: TopView
    var bottomView: BottomView
    var image: Image?
    var frame: CGRect
    
    var body: some View {
        VStack {
            self.topView
            
            Spacer()
            self.image?
                .resizable()
                .frame(width: self.frame.width, height: self.frame.height)
            
            Spacer()
            self.bottomView
        }.padding([.leading, .trailing], 12)
    }
}
