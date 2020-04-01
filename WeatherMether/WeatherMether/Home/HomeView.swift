//
//  HomeView.swift
//  WeatherMether
//
//  Created by Sadegh on 1/12/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @State var showingDetail = true
    
    var profileButton: some View {
        Button(action: {
            withAnimation {
                self.showingDetail.toggle()
            }
        }, label: {
            Image("ic_home_detailButton")
                .foregroundColor(CustomColorName.baseText.getColor)
        })
    }
    
    var body: some View {
        BaseNavigationView {
            ZStack {
                BaseView {
                    //                    PageView([BaseHomeView()])
                    BaseHomeView()
                        .navigationBarItems(trailing: self.profileButton)
                }
                
                if showingDetail {
                    MainDetailView()
                        .transition(.move(edge: .bottom))
                        .edgesIgnoringSafeArea(.bottom)
                    //                        .frame(height: 200)
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
