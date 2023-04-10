//
//  UserReposViewModel.swift
//  AgileContent_Challenge_IOS
//
//  Created by Camila Laura Lopez on 8/4/23.
//

import Foundation
import Combine

final class UserReposViewModel: ObservableObject{
    
    
    @Published var repos: [GitHubRepositories]?
    @Published var status = Status.none
    
    var suscriptors = Set<AnyCancellable>()
    var username: String
    
    
    init(username: String){
        self.username = username
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
            .decode(type: ReposResponse.self, decoder: JSONDecoder())
            .map{ reposResponse  in
                return reposResponse.response
            }
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
