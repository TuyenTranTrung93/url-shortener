//
//  DateExtensions.swift
//  Tuyen_URL_Shortener
//
//  Created by Tuyen Tran on 1/14/21.
//

import Foundation

extension Date {
    func toString(format: String = Constants.defaultDateFormat) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
