//
//  HomeViewModel.swift
//  Tuyen_URL_Shortener
//
//  Created by Tuyen Tran on 1/13/21.
//

import Foundation

protocol HomeViewModelProtocol {
    var getShortUrlSuccess: ((String) -> Void)? { get set }
    var getShortUrlFailure: ((String) -> Void)? { get set }
    func getShortUrl(url: String)
}

class HomeViewModel: HomeViewModelProtocol {
    
    private let repository: URLRepositoryProtocol!
    var getShortUrlSuccess: ((String) -> Void)?
    var getShortUrlFailure: ((String) -> Void)?
    
    init(reporsitory: URLRepositoryProtocol = URLRepository()) {
        self.repository = reporsitory
    }
    
    func getShortUrl(url: String) {
        repository.getShorterURL(url: url) { [weak self] (shortUrlString, errorMessage) in
            guard let self = self else { return }
            if let error = errorMessage {
                self.getShortUrlFailure?(error)
            } else {
                guard let shortUrl = shortUrlString else {
                    return
                }
                self.getShortUrlSuccess?(shortUrl)
            }
        }
    }
    
}
