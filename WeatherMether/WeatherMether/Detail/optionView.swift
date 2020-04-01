//
//  optionView.swift
//  WeatherMether
//
//  Created by Sadegh on 1/12/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import SwiftUI

struct optionView: View {
    @Binding var showView: Bool
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Color.clear.frame(height: geometry.size.height / 4)
                self.blurView
            }
        }
    }
    
    private var blurView: some View {
        ZStack {
            CustomColorName.mainDetailView.getColor
                .opacity(0.2)
                .contrast(-8)
            VisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterialLight))
            VStack {
                self.titleView
                    .padding(.top, 24)
                Spacer()
                self.buttonsView
                Spacer()
                self.closeButton
                    .padding(.bottom, 28)
            }
        }
    }
    
    private var titleView: some View {
        BaseText(text: "New York Today", font: Font.robotoMedium(15))
    }
    
    private var buttonsView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 36) {
                self.detailButton
                self.removeButton
                self.shareButton
            }
            Spacer()
        }.padding(.leading, 16)
    }
    
    private var detailButton: some View {
        Button(action: {
            print("Detail")
        }, label: {
            HStack {
                Image("ic_detail")
                    .foregroundColor(CustomColorName.baseText.getColor)
                BaseText(text: "Go to details", font: Font.robotoBold(14))
            }
        })
    }
    
    private var removeButton: some View {
        Button(action: {
            print("Remove")
        }, label: {
            HStack {
                Image("ic_remove")
                    .foregroundColor(CustomColorName.baseText.getColor)
                BaseText(text: "Remove", font: Font.robotoBold(14))
            }
        })
    }
    
    private var shareButton: some View {
        Button(action: {
            print("Share")
        }, label: {
            HStack {
                Image("ic_share")
                    .foregroundColor(CustomColorName.baseText.getColor)
                BaseText(text: "Share", font: Font.robotoBold(14))
            }
        })
    }
    
    private var closeButton: some View {
        Button(action: {
            withAnimation {
                self.showView = false
            }
        }, label: {
            BaseText(text: "Close", font: Font.robotoBold(16))
        })
    }
}

struct optionView_Previews: PreviewProvider {
    static var previews: some View {
        optionView(showView: .constant(true))
    }
}
