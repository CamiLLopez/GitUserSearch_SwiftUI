//
//  UserReposRowView.swift
//  AgileContent_Challenge_IOS
//
//  Created by Camila Laura Lopez on 9/4/23.
//

import SwiftUI

struct UserReposRowView: View {
    
    var repo: GitHubRepositories
    
    var body: some View {
        
        VStack(alignment: .leading){
            
            Text("\(repo.name)")
               .bold()
               .font(.headline)
               .padding([.leading], 10)
               .padding([.bottom], 2)
           if let language = repo.language{
               Text(language)
                   .font(.subheadline)
                   .padding([.leading], 10)
                   .foregroundColor(.gray)
           }
        }
    }
}

struct UserReposRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserReposRowView(repo: GitHubRepositories(id: 01, name: "Test", gitHubRepoPrivate: false, description: "", fork: false, url: "https://api.github.com/repos/CamiLLopez/book-5.0-1", language: "Java"))
    }
}
