//
//  Repo.swift
//  RepoList
//
//  Created by Marina Azevedo Ferreira Soares on 14/03/20.
//  Copyright © 2020 Marina Azevedo Ferreira Soares. All rights reserved.
//

import Foundation

struct RepoResponse: Codable {
    let  repo: [Repo]
//    let first: String
//    let last: String
//    let next: String
//    let prev: String
    
    enum CodingKeys: String, CodingKey {
        case repo = "items"
    }
}

struct Repo: Codable {
    var id: Int?
    var name: String?
    var owner: Owner?
    var description: String?
    var forks: Int?
    var stars: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case owner
        case description
        case forks
        case stars = "stargazers_count"
    }
    
    init(id: Int, name: String, owner: Owner?, description: String, forks: Int, stars: Int) {
        self.id = id
        self.name = name
        self.owner = owner
        self.description = description
        self.forks = forks
        self.stars = stars
    }
}




