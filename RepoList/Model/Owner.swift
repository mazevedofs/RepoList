//
//  Owner.swift
//  RepoList
//
//  Created by Marina Azevedo Ferreira Soares on 14/03/20.
//  Copyright © 2020 Marina Azevedo Ferreira Soares. All rights reserved.
//

import Foundation

struct Owner: Codable {
    var id: Int?
    var login: String?
    var avatar: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case login
        case avatar = "avatar_url"
    }
    
    init(id: Int, login: String, avatar: String) {
        self.id = id
        self.login = login
        self.avatar = avatar
    }
}
