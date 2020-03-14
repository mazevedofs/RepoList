//
//  PullRquests.swift
//  RepoList
//
//  Created by Marina Azevedo Ferreira Soares on 14/03/20.
//  Copyright © 2020 Marina Azevedo Ferreira Soares. All rights reserved.
//

import Foundation

struct PullRequest: Codable {
    var title: String?
    var user: Owner?
    var body: String?
    var creationDate: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case user
        case body
        case creationDate = "created_at"
    }
    
    init(title: String, user: Owner?, body: String, creationDate: String) {
        self.title = title
        self.user = user
        self.body = body
        self.creationDate = creationDate
    }
}
