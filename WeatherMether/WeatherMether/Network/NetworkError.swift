//
//  NetworkError.swift
//  WeatherMether
//
//  Created by amirhosseinpy on 1/7/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import Foundation

enum NetworkError: Error {
  case parsing(description: String)
  case network(description: String)
}
