//
//  SplashView.swift
//  WeatherMether
//
//  Created by amirhosseinpy on 1/13/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import SwiftUI

struct SplashView: View {
    @ObservedObject var viewModel: OnBoardingViewModel
    @State var haveLocation = false
    @State var haveLocationPermission = false
    
    init(viewModel: OnBoardingViewModel = OnBoardingViewModel()) {
        self.viewModel = viewModel
    }
    
    private var splashViewGenerator: some View {
       GeometryReader { geometry in
            ZStack {
            CustomColorName.splashBackground.getColor.edgesIgnoringSafeArea(.all)
                VStack { Image(ImageRefrences.weatherTypography.getImageName)
                    .padding(EdgeInsets(top: geometry.size.height/4, leading: 0, bottom: 0, trailing: 0))
                    Spacer()
                    
                Image(ImageRefrences.weatherStatus.getImageName).padding(EdgeInsets(top: 0, leading: 0, bottom: geometry.size.height/4, trailing: 0))
                    Spacer()
                }
            }
        }
    }
    
    var body: some View {
        ZStack {
            splashViewGenerator
            
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
