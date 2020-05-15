//
//  CitiesListCell.swift
//  WeatherMether
//
//  Created by Sadegh on 2/12/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import SwiftUI

struct CitiesListCell: View {
    var cityName: String
    @Binding var searchedLocation: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            BaseText(text: String(cityName[rangeOfFirstSubstring]), font: Font.robotoMedium(14), color: CustomColorName.paleText.getColor)
            BaseText(text: String(cityName[rangeOfSearchedSubstring]), font: Font.robotoMedium(14))
            BaseText(text: String(cityName[rangeOfLastSubstring]), font: Font.robotoMedium(14), color: CustomColorName.paleText.getColor)
        }.padding(.leading, 40)
    }
    
    private var rangeOfSearchedSubstring: Range<String.Index> {
        return cityName.lowercased().range(of: self.searchedLocation.lowercased()) ?? cityName.startIndex..<cityName.endIndex
    }
    
    private var rangeOfFirstSubstring: Range<String.Index> {
        return cityName.startIndex..<rangeOfSearchedSubstring.lowerBound
    }
    
    private var rangeOfLastSubstring: Range<String.Index> {
        return rangeOfSearchedSubstring.upperBound..<cityName.endIndex
    }
}

struct CitiesListCell_Previews: PreviewProvider {
    @State static var location = "teh"
    static var previews: some View {
        CitiesListCell(cityName: "Tehran", searchedLocation: $location)
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
