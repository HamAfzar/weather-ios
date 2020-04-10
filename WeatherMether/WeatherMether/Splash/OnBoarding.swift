//
//  SplashView.swift
//  WeatherMether
//
//  Created by amirhosseinpy on 1/13/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import SwiftUI

struct OnBoarding: View {
    //    @ObservedObject private var locationManager = LocationManager()
    @ObservedObject var viewModel: OnBoardingViewModel
    @State private var showErrorAlert = false
    @State private var showHomeView = false
    @State private var showSearchView = false
    
    init(viewModel: OnBoardingViewModel = OnBoardingViewModel()) {
        self.viewModel = viewModel
        self.viewModel.initFunctions()
        self.showErrorAlert = self.viewModel.error != nil ? true : false
        self.showHomeView = self.viewModel.showHomeView
        self.showSearchView = self.viewModel.showSearchView
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
            LoadingView(isShowing: .constant(self.viewModel.showLoading)) {
                ZStack {
                    self.splashViewGenerator.alert(isPresented: self.$showErrorAlert) {
                        Alert(title: Text(self.viewModel.error?.localizedDescription ?? "")) }
                }
            }
        }
        .navigate(to: HomeView(), when: self.$showHomeView)
    }
}

struct OnBoarding_Previews: PreviewProvider {
    static var previews: some View {
        OnBoarding()
    }
}
