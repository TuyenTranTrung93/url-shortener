//
//  DictionaryExtensionsTest.swift
//  Tuyen_URL_ShortenerTests
//
//  Created by Tuyen Tran on 1/12/21.
//

import XCTest
@testable import Tuyen_URL_Shortener

class DictionaryExtensionTest: XCTestCase {
    
    func test_toGetMethodParameters() {
        let testDictionary = [
            "url": "http://www.google.com"
        ]
        let value = testDictionary.toGetMethodParameters()
        XCTAssertEqual(value, "url=http://www.google.com")
    }
    
    func test_toGetMethodParameters_space() {
        let testDictionary = [
            "url": "http://www.google. com"
        ]
        let value = testDictionary.toGetMethodParameters()
        XCTAssertEqual(value, "url=http://www.google.%20com")
    }
    
    func test_toGetMethodParameters_specialCharacter() {
        let testDictionary = [
            "url": "http://www.google.*com"
        ]
        let value = testDictionary.toGetMethodParameters()
        XCTAssertEqual(value, "url=http://www.google.*com")
    }
    
}
