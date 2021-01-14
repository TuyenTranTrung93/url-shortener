//
//  Routers.swift
//  Tuyen_URL_Shortener
//
//  Created by Tuyen Tran on 1/13/21.
//

import Foundation

enum Router {
    case shortUrl
    
    var path: String {
        switch self {
        case .shortUrl:
            return "/api-create.php"
        }
    }
}
