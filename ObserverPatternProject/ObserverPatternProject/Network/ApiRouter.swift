//
//  ApiRouter.swift
//  ObserverPatternProject
//
//  Created by Youxel MacBook 8 on 8/25/19.
//  Copyright © 2019 Youxel Maged Mohammed. All rights reserved.
//

import Foundation
import Alamofire


enum GetDataRouter: URLRequestConvertible {
    static let baseURLString = "https://jsonplaceholder.typicode.com/"
    case users // get Users list
    case posts // get Posts list
    case createPost([String:Any])
    
    // MARK:- Url Request
    func asURLRequest() throws -> URLRequest {
        var method: HTTPMethod {
            switch self {
            case .users,.posts:
                return .get
            case .createPost:
                return .post
            }
        }
        
        //         MARK:- Parameters
        
        let params: ([String: Any]?) = {
            switch self {
            case .users,.posts:
                return nil
            case .createPost(let parameters):
                return parameters
            }
        }()
        
        //        MARK:- Endpoints
        
        let url: URL = {
            // build up and return the URL for each endpoint
            let relativePath: String?
            switch self {
            case .users:
                relativePath = "users"
            case .posts:
                relativePath = "posts"
            case .createPost:
                relativePath = "posts" // Send Post to server
            }
            var url = URL(string: GetDataRouter.baseURLString)!
            if let relativePath = relativePath {
                url = url.appendingPathComponent(relativePath)
            }
            return url
        }()
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        let encoding = JSONEncoding.default
        return try encoding.encode(urlRequest, with: params)
    }
}


