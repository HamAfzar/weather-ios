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
    @State private var showingMainDetailView = false
    
    private var haveValue: Bool {
        return self.viewModel.dataSource.count > 0
    }
    
    @ObservedObject var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        self.viewModel.checkLocationPermission()
    }
    
    private var pageView: PageView<BaseHomeView> {
        if haveValue {
            return PageView(viewModel.dataSource.map { BaseHomeView(current: $0.current) })
        } else {
            return PageView([BaseHomeView()])
        }
    }
    
    private var navigateToMainDetail: MainDetailView {
        if haveValue {
            return MainDetailView(weatherModel: viewModel.dataSource[pageView.currentPage])
        } else {
            return MainDetailView(weatherModel: nil)
        }
    }
    
    var body: some View {
        
        BaseNavigationView {
            ZStack {
                BaseView {
                     pageView.navigationBarItems(
                            leading: self.searchButton,
                            trailing: self.profileButton)
                }

                VStack {
                    if showingDetail {
                        OptionView(showView: $showingDetail, showMainDetailView: $showingMainDetailView)
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
        }.navigate(to: navigateToMainDetail, when: $showingMainDetailView)
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
        HomeView(viewModel: HomeViewModel())
    }
}
