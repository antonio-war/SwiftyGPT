//
//  SwiftyGPTChatResponseFormatTests.swift
//  
//
//  Created by Antonio Guerra on 27/04/24.
//

import XCTest
@testable import SwiftyGPTChat

final class SwiftyGPTChatResponseFormatTests: XCTestCase {
    
    var encoder: JSONEncoder!
    
    override func setUpWithError() throws {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .sortedKeys
        self.encoder = encoder
    }
    
    override func tearDownWithError() throws {
        self.encoder = nil
    }
    
    func testTextFormatInit() {
        let format = SwiftyGPTChatResponseFormat.text
        XCTAssertEqual(format.rawValue, "text")
    }
    
    func testTextFormatEncode() throws {
        let message = SwiftyGPTChatResponseFormat.text
        let encodedMessage = try encoder.encode(message)
        let encodedString = String(data: encodedMessage, encoding: .utf8)
        let expectedString = "{\"type\":\"text\"}"
        XCTAssertEqual(encodedString, expectedString)
    }
    
    func testJsonFormatInit() {
        let format = SwiftyGPTChatResponseFormat.json
        XCTAssertEqual(format.rawValue, "json_object")
    }
    
    func testJsonFormatEncode() throws {
        let message = SwiftyGPTChatResponseFormat.json
        let encodedMessage = try encoder.encode(message)
        let encodedString = String(data: encodedMessage, encoding: .utf8)
        let expectedString = "{\"type\":\"json_object\"}"
        XCTAssertEqual(encodedString, expectedString)
    }
}
