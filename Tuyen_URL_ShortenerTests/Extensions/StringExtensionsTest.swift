//
//  StringExtensions.swift
//  Tuyen_URL_ShortenerTests
//
//  Created by Tuyen Tran on 1/14/21.
//

import Foundation
import XCTest
@testable import Tuyen_URL_Shortener

class StringExtensionsTest: XCTestCase {
    func test_toDate() {
        let date = Date(timeIntervalSince1970: 1610628693)
        let actual = date.toString()
        XCTAssertEqual(actual, "01-14-2021 (07:51 PM)")
    }
    
    func test_toDate_otherFormat() {
        let date = Date(timeIntervalSince1970: 1610628693)
        let actual = date.toString(format: "MM-dd-yyyy")
        XCTAssertEqual(actual, "01-14-2021")
    }
    
    func test_toDate_wrongFormat() {
        let date = Date(timeIntervalSince1970: 1610628693)
        let actual = date.toString(format: "!@#$%^")
        XCTAssertEqual(actual, "!@#$%^")
    }
}
