//
//  Optionnal+Valid.swift
//  RepoList
//
//  Created by Marina Azevedo Ferreira Soares on 14/03/20.
//  Copyright © 2020 Marina Azevedo Ferreira Soares. All rights reserved.
//

import Foundation

extension Optional where Wrapped == Bool {
    var valid: Bool {
        switch self {
        case .some(let value):
            return value
        default:
            return false
        }
    }
}

extension Optional where Wrapped == String {
    var valid: String {
        switch self {
        case .some(let value):
            return value
        default:
            return ""
        }
    }
}

extension Optional where Wrapped == Int {
    var valid: Int {
        switch self {
        case .some(let value):
            return value
        default:
            return 0
        }
    }
}

extension Optional where Wrapped == Double {
    var valid: Double {
        switch self {
        case .some(let value):
            return value
        default:
            return 0.0
        }
    }
}
