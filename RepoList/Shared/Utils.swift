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
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: stringDate ?? "")!
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dateFormatter.locale = Locale(identifier:"pt_BR") 
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    
}
