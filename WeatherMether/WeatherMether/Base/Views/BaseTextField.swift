//
//  BaseTextField.swift
//  WeatherMether
//
//  Created by Sadegh on 1/13/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import SwiftUI

struct BaseTextField: View {
    @Binding var text: String
    var placeholder: BaseText
    var image: Image?
    var editingChanged: (Bool) -> Void = { _ in }
    var commit: () -> Void = {}
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10).fill((CustomColorName.textField.getColor))
            if text.isEmpty {
                HStack(spacing: 8) {
                    placeholder
                }
                .padding(.leading, 28)
            }
            
            HStack(spacing: 4) {
                image?.foregroundColor(CustomColorName.textFieldPlaceHolder.getColor).padding(.leading, 8)
                TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
                    .font(Font.robotoMedium(14))
                    .foregroundColor(CustomColorName.baseText.getColor)
                    .accentColor(CustomColorName.baseText.getColor)
                    .frame(height: 32)
                    .cornerRadius(10)
            }
        }
    }
}
