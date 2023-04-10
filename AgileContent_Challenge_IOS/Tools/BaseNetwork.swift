//
//  BaseNetwork.swift
//  AgileContent_Challenge_IOS
//
//  Created by Camila Laura Lopez on 7/4/23.
//

import Foundation
    
    
    let server = "https://api.github.com"
    
    
    struct HTTPMethods {
        static let post = "POST"
        static let get = "GET"
        static let put = "PUT"
        static let delete = "DELETE"
        static let content = "application/json"
    }
    
    enum endpoints: String{
        case user = "/users/username"
        case repositories = "/users/username/repos"
    }
    
    
    struct BaseNetwork {
        
        
        func getUser(username: String) -> URLRequest {
            
            let endpointParametre: String = endpoints.user.rawValue.replacingOccurrences(of: "username", with: String(username))
            
            let url: String = "\(server)\(endpointParametre)"
            
            var request : URLRequest = URLRequest(url: URL(string: url)!)
            request.httpMethod = HTTPMethods.get
            
            
            return request
        }
        
        func getUserRepositories(username: String) -> URLRequest {
            
            let endpointParametre: String = endpoints.repositories.rawValue.replacingOccurrences(of: "username", with: String(username))
            
            let url: String = "\(server)\(endpointParametre)"
            
            var request : URLRequest = URLRequest(url: URL(string: url)!)
            request.httpMethod = HTTPMethods.get
            
            
            return request
        }
}
    
