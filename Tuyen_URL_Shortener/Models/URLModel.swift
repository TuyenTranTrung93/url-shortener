//
//  URLModels.swift
//  Tuyen_URL_Shortener
//
//  Created by Tuyen Tran on 1/14/21.
//

import Foundation

struct URLModel: Codable  {
    let time: Date
    let rootUrl: String
    let shortUrl: String
}
