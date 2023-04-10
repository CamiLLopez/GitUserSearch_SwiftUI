//
//  GitHubRepoModelTest.swift
//  AgileContent_Challenge_IOS
//
//  Created by Camila Laura Lopez on 10/4/23.
//

import XCTest

final class GitHubRepoModelTest: XCTestCase {

    var repo: GitHubRepositories!

    override func setUp() {
        super.setUp()
        
        repo = GitHubRepositories(id: 383594947, name: "ejerciciosPython", gitHubRepoPrivate: false, description: "", fork: false, url: "https://api.github.com/repos/CamiLLopez/ejerciciosPython", language: "Python")
    }

    override func tearDown() {
        repo = nil
        
        super.tearDown()
    }
        
       
    func testRepoName() {
          
            let name = repo.name
            
            XCTAssertNotNil(repo)
            XCTAssertNotNil(name)
            XCTAssertEqual(name, "ejerciciosPython")
        }
        
   func testRepoID() {
            
            let id = repo.id
            
            XCTAssertNotNil(id)
            XCTAssertGreaterThan(id, 0)
        }
}

