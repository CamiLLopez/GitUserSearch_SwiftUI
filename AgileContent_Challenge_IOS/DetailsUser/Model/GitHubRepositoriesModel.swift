//
//  GitHubRepositoriesModel.swift
//  AgileContent_Challenge_IOS
//
//  Created by Camila Laura Lopez on 7/4/23.
//

import Foundation


struct GitHubRepositories: Decodable, Identifiable {
    
       let id: Int
       let name: String
       let gitHubRepoPrivate: Bool
       let description: String?
       let fork: Bool
       let url: String
       let language: String?

       enum CodingKeys: String, CodingKey {
           case id
           case name
           case gitHubRepoPrivate = "private"
           case description, fork, url
           case language
       }
    
}
