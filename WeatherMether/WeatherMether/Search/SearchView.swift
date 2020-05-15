//
//  SearchView.swift
//  WeatherMether
//
//  Created by Sadegh on 1/13/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    @Environment(\.localStatusBarStyle) var statusBarStyle
    @State var location: String = ""
    
    @ObservedObject var viewModel: SearchViewModel
    
    init(showView: Binding<Bool>) {
        self.viewModel = SearchViewModel(showView: showView)
    }
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 0) {
            self.searchView
            CitiesListView(cities: self.viewModel.dataSource, searchedLocation: $location)
                .navigationBarHidden(true)
        }
            
        .onAppear {
            self.statusBarStyle.currentStyle = .lightContent
        }
        .onDisappear {
            self.statusBarStyle.currentStyle = .default
        }
    }
    
    private var searchView: some View {
        ZStack {
            CustomColorName.baseText.getColor
            self.textField
        }.frame(height: 100)
    }
    
    private var textField: some View {
        HStack(alignment: .center) {
            BaseTextField(
                text: bindingString,
                placeHolder: BaseText(text: "Search for City, Your Location", font: Font.roboto(14), color: CustomColorName.textFieldPlaceHolder.getColor),
                image: Image("ic_search_placeHolder"))
            
            self.cancelButton
        }
        .padding(EdgeInsets(top: 48, leading: 16, bottom: 16, trailing: 16))
    }
    
    private var cancelButton: some View {
        Button(action: {
            UIApplication.shared.endEditing()
            self.viewModel.showView = false
        }, label: {
            BaseText(text: "Cancel", font: Font.robotoMedium(12), color: CustomColorName.mainDetailView.getColor)
        })
    }
    
    private var bindingString: Binding<String> {
        return Binding<String>(
            get: { self.location },
            set: {
                self.location = $0
                self.textFieldDidChange()
        })
    }
    
    private func textFieldDidChange() {
        if self.location.count >= 3 {
            self.viewModel.getCities(city: self.location)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(showView: .constant(true))
    }
}
