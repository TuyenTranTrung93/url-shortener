//
//  UserDefaultExtensions.swift
//  Tuyen_URL_Shortener
//
//  Created by Tuyen Tran on 1/14/21.
//

import Foundation

extension UserDefaults {
    
    static func standardSave(key: String, value: Data) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    static func standardGetObjectArray<T: Codable>(key: String) -> [T] {
        let decoder = JSONDecoder()
        if let data = UserDefaults.standard.data(forKey: key),
           let array = try? decoder.decode([T].self, from: data) {
            return array
        } else {
            return []
        }
    }
    
}
