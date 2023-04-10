//
//  GitHubUserModel.swift
//  AgileContent_Challenge_IOS
//
//  Created by Camila Laura Lopez on 7/4/23.
//

import Foundation

struct GitHubUser: Decodable {
    
    let login: String
    let id: Int
    let avatar_url: String
    let url: String
    let repos_url: String
    let public_repos: Int

}
