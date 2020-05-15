//
//  UIApplicationExtensions.swift
//  WeatherMether
//
//  Created by Sadegh on 1/14/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
