//
//  StringExtensions.swift
//  Tuyen_URL_Shortener
//
//  Created by Tuyen Tran on 1/14/21.
//

import Foundation


extension String {
    
    func toDate(format: String = Constants.defaultDateFormat) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.date(from: self)
    }
    
}

extension NSMutableAttributedString {
    
    func setAsLink(linkName:String) -> NSMutableAttributedString {
        let foundRange = mutableString.range(of: string)
        if foundRange.location != NSNotFound, let url = URL(string: linkName) {
            addAttribute(.link, value: url, range: foundRange)
        }
        return self
    }
    
}
