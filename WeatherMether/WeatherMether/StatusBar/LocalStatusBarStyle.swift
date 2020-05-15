//
//  LocalStatusBarStyle.swift
//  WeatherMether
//
//  Created by Sadegh on 1/14/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import SwiftUI
import UIKit

class LocalStatusBarStyle {
    var getter: () -> UIStatusBarStyle = { .default }
    var setter: (UIStatusBarStyle) -> Void = {_ in}
    
    var currentStyle: UIStatusBarStyle {
        get { self.getter() }
        set { self.setter(newValue) }
    }
}

struct LocalStatusBarStyleKey: EnvironmentKey {
    static let defaultValue: LocalStatusBarStyle = LocalStatusBarStyle()
}
