//
//  HomeView.swift
//  WeatherMether
//
//  Created by Sadegh on 1/12/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @State private var showingDetail = false
    @State private var showingSearch = false
    
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
                        OptionView(showView: $showingDetail)
                            .transition(.move(edge: .bottom))
                            .edgesIgnoringSafeArea(.bottom)
                    }
                }
                
                VStack {
                    if self.showingSearch {
                        SearchView(showView: $showingSearch)
                            .transition(.move(edge: .top))
                            .edgesIgnoringSafeArea(.all)
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
        }).padding([.leading, .trailing, .top, .bottom], 4)
    }
    
    private var searchButton: some View {
        Button(action: {
            withAnimation {
                self.showingSearch.toggle()
            }
        }, label: {
            Image("ic_home_searchButton")
                .foregroundColor(CustomColorName.baseText.getColor)
        }).padding([.leading, .trailing, .top, .bottom], 4)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
