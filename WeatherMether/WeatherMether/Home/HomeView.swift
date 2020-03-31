//
//  HomeView.swift
//  WeatherMether
//
//  Created by Sadegh on 1/12/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        HomeNavigationView {
            BaseView {
                PageView([BaseHomeView()])
            }
            .navigationBarItems(
                leading: Image("ic_home_searchButton"),
                trailing: Image("ic_home_detailButton")
            )
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
