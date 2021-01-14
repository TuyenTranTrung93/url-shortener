//
//  Dictionary + Extensions.swift
//  Tuyen_URL_Shortener
//
//  Created by Tuyen Tran on 1/12/21.
//

import Foundation

extension Dictionary {
    
    func toGetMethodParameters() -> String {
        var stringParams = ""
        for (key, value) in self {
            stringParams += "\(key)="
            stringParams += "\(value)"
        }
        return stringParams.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        
    }
    
}
