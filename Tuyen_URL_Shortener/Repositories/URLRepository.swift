//
//  HomeRepository.swift
//  Tuyen_URL_Shortener
//
//  Created by Tuyen Tran on 1/13/21.
//

import Foundation

protocol URLRepositoryProtocol {
    func getShorterURL(url: String, completionHandler: ((String?, String?) -> Void)?)
}

class URLRepository: URLRepositoryProtocol {
    
    enum Messages {
        static let wrongParseResponse: String = "Can NOT parse response"
    }
    
    private let services = RequestServices()
    
    func getShorterURL(url: String, completionHandler: ((String?, String?) -> Void)?) {
        services.get(from: .shortUrl, params: ["url": url]) { (result) in
            switch result {
            case .success(let (data, response)):
                if response.statusCode == 200, let shortUrl = String(data: data, encoding: .utf8) {
                    let date = Date()
                    let object = URLModel(time: date, rootUrl: url, shortUrl: shortUrl)
                    Constants.urlModels.append(object)
                    completionHandler?(shortUrl, nil)
                } else {
                    if let error = String(data: data, encoding: .utf8) {
                        completionHandler?(nil, error)
                    } else {
                        completionHandler?(nil, Messages.wrongParseResponse)
                    }
                }
            case .failure(let error):
                guard let castError = error as? RequestError else {
                    completionHandler?(nil, error.localizedDescription)
                    return
                }
                completionHandler?(nil, castError.message)
            }
        }
    }
    
}
