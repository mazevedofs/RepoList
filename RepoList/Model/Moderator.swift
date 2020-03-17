//
//  Moderator.swift
//  RepoList
//
//  Created by Marina Azevedo Ferreira Soares on 17/03/20.
//  Copyright © 2020 Marina Azevedo Ferreira Soares. All rights reserved.
//

import Foundation

struct Moderator: Codable {
    var prev: String?
    var last: String?
    var next: String?
    var first: String?
    var page: Int
}

/*
<https://api.github.com/search/repositories?q=language%3AJava&sort=stars&page=6>; rel="prev", <https://api.github.com/search/repositories?q=language%3AJava&sort=stars&page=8>; rel="next", <https://api.github.com/search/repositories?q=language%3AJava&sort=stars&page=34>; rel="last", <https://api.github.com/search/repositories?q=language%3AJava&sort=stars&page=1>; rel="first"

 */


class ModeratorViewModel {
    let moderator: Moderator
    
    init(moderator: Moderator) {
        self.moderator = moderator
    }
    
    var page: Int {
        return moderator.page
    }
}
