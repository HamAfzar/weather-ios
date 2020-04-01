//
//  HomeView.swift
//  WeatherMether
//
//  Created by Sadegh on 1/12/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @State private  var showingDetail = false
    
    var body: some View {
        BaseNavigationView {
            ZStack {
                BaseView {
                    PageView([BaseHomeView()])
                        .navigationBarItems(
                            leading: self.searchButton,
                            trailing: self.profileButton
                    )
                }
                
                VStack {
                    if showingDetail {
                        optionView(showView: $showingDetail)
                            .transition(.move(edge: .bottom))
                            .edgesIgnoringSafeArea(.bottom)
                    }
                }
            }
        }
    }
    
    private var profileButton: some View {
        Button(action: {
            withAnimation {
                self.showingDetail.toggle()
            }
        }, label: {
            Image("ic_home_detailButton")
                .foregroundColor(CustomColorName.baseText.getColor)
        })
    }
    
    private var searchButton: some View {
        Button(action: {
            
        }, label: {
            Image("ic_home_searchButton")
                .foregroundColor(CustomColorName.baseText.getColor)
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
