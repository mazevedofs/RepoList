//
//  Utils.swift
//  RepoList
//
//  Created by Marina Azevedo Ferreira Soares on 15/03/20.
//  Copyright © 2020 Marina Azevedo Ferreira Soares. All rights reserved.
//

import Foundation

class Utils {
    class func getFormattedDateFrom(date stringDate: String?) -> String {
        var dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        guard let dateStr = stringDate,
              let transactionDate = dateStr.components(separatedBy: ".").first,
              let date = dateFormatter.date(from: transactionDate) else {
            dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            return dateFormatter.string(from: Date())
        }
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dateFormatter.locale = Locale(identifier: "pt_BR")
        return dateFormatter.string(from: date).uppercased()
    }
    
}
