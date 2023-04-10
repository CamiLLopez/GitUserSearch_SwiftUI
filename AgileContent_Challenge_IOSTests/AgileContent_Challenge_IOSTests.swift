//
//  AgileContent_Challenge_IOSTests.swift
//  AgileContent_Challenge_IOSTests
//
//  Created by Camila Laura Lopez on 5/4/23.
//

import XCTest
@testable import AgileContent_Challenge_IOS
import Combine


final class AgileContent_Challenge_IOSTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func testUserRepos () throws{
        
        var suscriptor = Set<AnyCancellable>()
        let expectation = self.expectation(description: "User search")
        
        
        let viewModel = SearchUserViewModel(testingMode: true)
        XCTAssertNotNil(viewModel)
        
        viewModel.user.publisher
            .sink { completion in
                switch completion{
                case .finished:
                    XCTAssertEqual(1, 1)
                    expectation.fulfill()
                case .failure:
                    XCTAssertEqual(1, 2)
                    expectation.fulfill()
                }
            } receiveValue: { user in
                
                XCTAssertNotNil(user)
               
            }
            .store(in: &suscriptor)
        
        viewModel.getGitHubUserTesting()
        
        self.waitForExpectations(timeout: 10)

    }
    
    func testReposByUser () throws{
        
        var suscriptor = Set<AnyCancellable>()
        let expectation = self.expectation(description: "Repos List")
        
        
        let viewModel = SearchUserViewModel(testingMode: true)
        XCTAssertNotNil(viewModel)
        
        viewModel.repos.publisher
            .sink { completion in
                switch completion{
                case .finished:
                    XCTAssertEqual(1, 1)
                    expectation.fulfill()
                case .failure:
                    XCTAssertEqual(1, 2)
                    expectation.fulfill()
                }
            } receiveValue: { repos in
                
                XCTAssertNotNil(repos)
                XCTAssertGreaterThanOrEqual(3, repos.count)
            }
            .store(in: &suscriptor)
        
        viewModel.getReposByUsernameTesting()
        
        self.waitForExpectations(timeout: 10)
    }

}
