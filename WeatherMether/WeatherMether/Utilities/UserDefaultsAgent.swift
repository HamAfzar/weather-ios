//
//  UserDefaultsAgent.swift
//  WeatherMether
//
//  Created by amirhosseinpy on 1/29/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import Foundation

class UserDefaultsAgent {
    
    func deleteValue(key: UserDefaultKeys) {
        UserDefaults.standard.removeObject(forKey: key.rawValue)
    }
    
    func deleteAllValues() {
        for item in UserDefaultKeys.allCases {
            deleteValue(key: item)
        }
    }
    
    func saveValue<T: Codable>(model: T, key: UserDefaultKeys) {
        UserDefaults.standard.setStruct(model, forKey: key.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    func getValue<T: Codable>(key: UserDefaultKeys) -> T? {
        
        return (UserDefaults.standard.object(forKey: key.rawValue) as? T)
    }
}

enum UserDefaultKeys: String, CaseIterable {
    case cities
}

private extension UserDefaults {
    func setStruct<T: Codable>(_ value: T?, forKey defaultName: String) {
        let data = try? JSONEncoder().encode(value)
        set(data, forKey: defaultName)
    }
}
