//
//  SplashView.swift
//  WeatherMether
//
//  Created by amirhosseinpy on 1/13/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import SwiftUI

struct OnBoarding: View {

    @ObservedObject var viewModel: OnBoardingViewModel

    init(viewModel: OnBoardingViewModel = OnBoardingViewModel()) {
        self.viewModel = viewModel
        self.viewModel.initFunctions()
        
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
//        ZStack {
//            LoadingView(isShowing: .constant(self.viewModel.showLoading)) {
                ZStack {
                    self.splashViewGenerator
//                        .alert(isPresented: self.$viewModel.showError) {
//                        Alert(title: Text(self.viewModel.error?.localizedDescription ?? "")) }
                }
//            }
//        }
                    .navigate(to: HomeView(viewModel: HomeViewModel()), when: self.$viewModel.showHomeView)
        .navigate(to: SearchView(showView: self.$viewModel.showHomeView), when: self.$viewModel.showSearchView)
    }
}

struct OnBoarding_Previews: PreviewProvider {
    static var previews: some View {
        OnBoarding()
    }
}
