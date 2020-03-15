//
//  Models.swift
//  RepoList
//
//  Created by Marina Azevedo Ferreira Soares on 15/03/20.
//  Copyright © 2020 Marina Azevedo Ferreira Soares. All rights reserved.
//

import Foundation

enum SortOrder: String {
    case star = "stars"
    case fork = "forks"
}

enum RepoState: String {
    case open = "open"
    case closed = "closed"
    case all = "all"
}

