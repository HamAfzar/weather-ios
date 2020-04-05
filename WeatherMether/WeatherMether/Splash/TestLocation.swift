//
//  TestLocation.swift
//  WeatherMether
//
//  Created by amirhosseinpy on 1/14/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import SwiftUI

struct TestLocation: View {
    @ObservedObject var lm = LocationManager()

    var latitude: String { return("\(lm.location?.coordinate.latitude ?? 0)") }
    var longitude: String { return("\(lm.location?.coordinate.longitude ?? 0)") }
    var placemark: String { return("\(lm.placemark?.description ?? "XXX")") }
    var status: String { return("\(lm.status ?? .notDetermined)") }

    var body: some View {
        VStack {
            Text("Latitude: \(self.latitude)")
            Text("Longitude: \(self.longitude)")
            Text("Placemark: \(self.placemark)")
            Text("Status: \(self.status)")
        }
    }
}

struct TestLocation_Previews: PreviewProvider {
    static var previews: some View {
        TestLocation()
    }
}
