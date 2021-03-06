//
//  APIRouter.swift
//  Test Mister Auto
//
//  Created by Mohammed Hajajate on 9/20/20.
//  Copyright © 2020 Mohammed Hajajate. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter: APIConfiguration {
    
    case usersList
    case tasksList(userId: Int)
    
    // MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
        case .usersList:
            return .get
        case .tasksList:
            return .get
        }
    }
    // MARK: - Parameters
     var parameters: RequestParams {
        switch self {
        case .usersList:
            return .url([:])
        case .tasksList(let userId):
            return .url(["userId": userId])
        }
    }
    
    // MARK: - Path
    var path: String {
        switch self {
        case .usersList:
            return "/users/"
        case .tasksList:
            return "/todos"
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try Constants.ProductionServer.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        // Parameters
        switch parameters {
            
        case .body(let params):
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
            
        case .url(let params):
                let queryParams = params.map { pair  in
                    return URLQueryItem(name: pair.key, value: "\(pair.value)")
                }
                var components = URLComponents(string:url.appendingPathComponent(path).absoluteString)
                components?.queryItems = queryParams
                urlRequest.url = components?.url
        }
        if !(NetworkReachabilityManager()?.isReachable ?? false) {
            urlRequest.cachePolicy = .returnCacheDataDontLoad
        }
        return urlRequest
    }
}
