//
//  Constants.swift
//  Tuyen_URL_Shortener
//
//  Created by Tuyen Tran on 1/14/21.
//

import Foundation

struct Constants {
    static var urlModels: [URLModel] = UserDefaults.standardGetObjectArray(key: "urlModels") {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(urlModels) {
                UserDefaults.standardSave(key: "urlModels", value: encoded)
            }
        }
    }
    
    static var defaultDateFormat = "MM-dd-yyyy (hh:mm aa)"
}
