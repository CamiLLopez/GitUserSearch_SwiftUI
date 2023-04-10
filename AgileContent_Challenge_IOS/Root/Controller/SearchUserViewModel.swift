//
//  SearchUserViewModel.swift
//  AgileContent_Challenge_IOS
//
//  Created by Camila Laura Lopez on 7/4/23.
//

import Foundation
import Combine


final class SearchUserViewModel: ObservableObject {
    
    @Published var user: GitHubUser?
    @Published var status: Status = Status.none
    @Published var repos: [GitHubRepositories]?
  
    
    var suscriptors = Set<AnyCancellable>()
    var username: String = ""
    
    init(testingMode: Bool = false){
        if(testingMode){
            getGitHubUserTesting()
        }
        
    }
    
    func getGitHubUser(username: String){
        
        self.username = username
        self.status = .loading
        
        URLSession.shared
            .dataTaskPublisher(for: BaseNetwork().getUser(username: self.username))
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else{
                    throw URLError(.badServerResponse)
                }
                debugPrint($0.data)
                return $0.data
            }
            .decode(type: GitHubUser.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion{
                case .failure:
                    self.status = Status.error(error: "User not found. Please enter another name")
                case .finished:
                    self.status = .ready
                    self.getReposByUsername()
                }
                
            } receiveValue: { data in
                self.user = data
            }
            .store(in: &suscriptors)
    }
    
    func getReposByUsername(){
        
        self.status = .loading
        
        URLSession.shared
            .dataTaskPublisher(for: BaseNetwork().getUserRepositories(username: self.username))
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else{
                    throw URLError(.badServerResponse)
                }
                return $0.data
            }
            .decode(type: [GitHubRepositories].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion{
                case .failure:
                    self.status = Status.error(error: "Error getting GitHub repositories, please try again later")
                case .finished:
                    self.status = .ready
                }
            } receiveValue: { data in
                self.repos = data
            }
            .store(in: &suscriptors)

    }
    
    
    func getGitHubUserTesting(){
        
        let user = GitHubUser(login: "CamiLLopez", id: 53200676, avatar_url: "https://avatars.githubusercontent.com/u/53200676?v=4", url: "https://api.github.com/users/CamiLLopez", repos_url: "https://api.github.com/users/CamiLLopez/repos", public_repos: 17)
        
    }
    
    func getReposByUsernameTesting(){
        
        let repo = GitHubRepositories(id: 383594947, name: "ejerciciosPython", gitHubRepoPrivate: false, description: "", fork: false, url: "https://api.github.com/repos/CamiLLopez/ejerciciosPython", language: "Python")
        let repo1 = GitHubRepositories(id: 482874368, name: "FCC", gitHubRepoPrivate: false, description: "", fork: false, url: "https://api.github.com/repos/CamiLLopez/FCC", language: "JavaScript")
        let repo2 = GitHubRepositories(id: 622333320, name: "KCIOSSwiftUI", gitHubRepoPrivate: false, description: "", fork: false, url: "https://api.github.com/repos/CamiLLopez/KCIOSSwiftUI", language: "Swift")
       
        
        self.repos = [repo, repo1, repo2]
    }
}
