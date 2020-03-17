//
//  RepoListTests.swift
//  RepoListTests
//
//  Created by Marina Azevedo Ferreira Soares on 13/03/20.
//  Copyright © 2020 Marina Azevedo Ferreira Soares. All rights reserved.
//

import XCTest
@testable import RepoList

class RepoListTests: XCTestCase {
    var sut: ListTableViewController!
    
    override func setUp() {
        super.setUp()
        sut = ListTableViewController()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_LoadData() {
        // given
        let promise = expectation(description: "Status code: 200")

        // when
        XCTAssertEqual(sut.repo.count, 0, "searchResults should be empty before the data task runs")
        RepoAPI.loadRepoList(language: "Java", sort: "stars", page: 1, onComplete: { (response) in
             guard let url = Bundle.main.url(forResource: "repo", withExtension: "json") else {return}
                   do {
                       let data = try Data(contentsOf: url)
                       let jsonDecoder = JSONDecoder()
                       let repo = try jsonDecoder.decode([Repo].self, from: data)
                        self.sut.repo = repo
                   } catch {
                       print(error)
                   }
            
        }) { (error) in
            
        }
        
        wait(for: [promise], timeout: 20)
        
        XCTAssertEqual(sut.repo.count, 30, "Nao foi possivel parsear resposta")
    }

}
