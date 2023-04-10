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
                    self.status = Status.error(error: "Error to get user from API")
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
                    self.status = Status.error(error: "Error in GitHub repos")
                case .finished:
                    self.status = .ready
                }
            } receiveValue: { data in
                self.repos = data
            }
            .store(in: &suscriptors)

    }
}
