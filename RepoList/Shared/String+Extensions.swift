//
//  String+Extensions.swift
//  RepoList
//
//  Created by Marina Azevedo Ferreira Soares on 14/03/20.
//  Copyright © 2020 Marina Azevedo Ferreira Soares. All rights reserved.
//

import UIKit

extension String {
    func with(font: UIFont, color: UIColor) -> NSMutableAttributedString {
        return NSMutableAttributedString(string: self,
                                         attributes: [NSAttributedString.Key.font: font,
                                                      NSAttributedString.Key.foregroundColor: color])
    }
}
