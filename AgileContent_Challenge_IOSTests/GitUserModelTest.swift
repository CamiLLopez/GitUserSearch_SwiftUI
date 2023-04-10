//
//  GitUserModelTest.swift
//  AgileContent_Challenge_IOSTests
//
//  Created by Camila Laura Lopez on 10/4/23.
//

import XCTest

final class GitUserModelTest: XCTestCase {

    var user: GitHubUser!

    override func setUp() {
        super.setUp()
        
        user = GitHubUser(login: "CamiLLopez", id: 53200676, avatar_url: "https://avatars.githubusercontent.com/u/53200676?v=4", url: "https://api.github.com/users/CamiLLopez", repos_url: "https://api.github.com/users/CamiLLopez/repos", public_repos: 17)
    }

    override func tearDown() {
        user = nil
        
        super.tearDown()
    }
        
       
    func testUserName() {
          
            let name = user.login
            
            XCTAssertNotNil(user)
            XCTAssertNotNil(name)
            XCTAssertEqual(name, "CamiLLopez")
        }
        
   func testUerID() {
            
            let id = user.id
            
            XCTAssertNotNil(id)
            XCTAssertGreaterThan(id, 0)
        }
    
    func testCountRepos(){
        
        let publicRepos = user.public_repos
        
        XCTAssertNotNil(publicRepos)
        XCTAssertEqual(publicRepos, 17)
        XCTAssertGreaterThan(publicRepos, 0)
    }
}
