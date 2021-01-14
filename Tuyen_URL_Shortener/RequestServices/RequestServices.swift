//
//  RequestServices.swift
//  Tuyen_URL_Shortener
//
//  Created by Tuyen Tran on 1/12/21.
//

import Foundation

// Error Type
enum RequestError: Error {
    
    enum Messages {
        static let unknownError: String = "Unknown Error"
        static let wrongURL: String = "Wrong URL"
    }
    
    case unknownError
    case wrongURL
    case normalError(message: String)
    
    var message: String {
        switch self {
        case .unknownError:
            return Messages.unknownError
        case .wrongURL:
            return Messages.wrongURL
        case .normalError(let message):
            return message
        }
    }
    
    static func ==(value1: RequestError, value2: RequestError) -> Bool {
        switch (value1, value2) {
        case (.unknownError, .unknownError), (.wrongURL, .wrongURL), (.normalError(_), .normalError(_)):
            return true
        default:
            return false
        }
    }
}

// HTTPServicesProtocol
protocol HTTPServicesProtocol {
  
  typealias Result = Swift.Result<(Data, HTTPURLResponse), Error>
  
  func get(from router: Router,
           params: [String: String],
           completion: @escaping (HTTPServicesProtocol.Result) -> Void)
}

// MARK: - Request Services
class RequestServices: HTTPServicesProtocol {
    
    private let session = URLSession.shared
    private let baseUrl = "http://tinyurl.com"
    
    func get(from router: Router,
             params: [String : String],
             completion: @escaping (Result<(Data, HTTPURLResponse), Error>) -> Void) {
        let paramsString = params.toGetMethodParameters()
        let url = baseUrl + router.path
        guard let urlRequest = URL(string: "\(url)?\(paramsString)") else {
            completion(.failure(RequestError.wrongURL))
            return
        }
        var request = URLRequest(url: urlRequest)
        request.httpMethod = "GET"

        session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(RequestError.normalError(message: error.localizedDescription)))
            } else if let data = data, let response = response as? HTTPURLResponse {
                completion(.success((data, response)))
            } else {
                completion(.failure(RequestError.unknownError))
            }
        }.resume()
    }
    
}
