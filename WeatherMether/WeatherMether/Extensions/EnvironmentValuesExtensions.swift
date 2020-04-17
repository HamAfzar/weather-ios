//
//  EnvironmentValuesExtensions.swift
//  WeatherMether
//
//  Created by Sadegh on 1/14/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    var localStatusBarStyle: LocalStatusBarStyle {
            return self[LocalStatusBarStyleKey.self]
    }
}
