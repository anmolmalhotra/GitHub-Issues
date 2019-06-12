//
//  Router.swift
//  Github Issues
//
//  Created by Anmol Malhotra on 11/06/19.
//  Copyright © 2019 Anmol Malhotra. All rights reserved.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    
    static var baseURL: String {
        return "https://api.github.com/"
    }
    
    case issues
    case comments(Int)
    
    func asURLRequest() throws -> URLRequest {
        
        var method: HTTPMethod {
            switch self {
            default:
                return .get
            }
        }
        
        func urlComponents(for url: URL) -> URLComponents? {
            var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
            
            switch self {
            case .issues:
                urlComponents?.queryItems = [
                    URLQueryItem(name: "state", value: "all"),
                    URLQueryItem(name: "sort", value: "updated"),
                    
                ]
                
                return urlComponents
                
            default:
                return nil
            }
        }
        
        let url: URL = {
            var relativeURL: String?
            
            switch self {
            case .issues:
                relativeURL = "repos/crashlytics/secureudid/issues"
            case .comments(let id):
                relativeURL = "repos/crashlytics/secureudid/issues/\(id)/comments"
            }
            
            var url = URL(string: Router.baseURL)!
            
            if let relativeURL = relativeURL {
                url = url.appendingPathComponent(relativeURL)
            }
            
            if let urlWithQueryItems = urlComponents(for: url)?.url {
                url = urlWithQueryItems
            }
            
            return url
        }()
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        let encoding = JSONEncoding.default
        return try encoding.encode(urlRequest)
    }
}
