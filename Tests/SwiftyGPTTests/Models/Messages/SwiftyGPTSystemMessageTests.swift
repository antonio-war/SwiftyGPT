//
//  SwiftyGPTSystemMessageTests.swift
//
//
//  Created by Antonio Guerra on 09/04/24.
//

@testable import SwiftyGPT
import XCTest

final class SwiftyGPTSystemMessageTests: XCTestCase {
    
    func testInitWhenNameIsNil() {
        let message = SwiftyGPTSystemMessage(content: "Test", name: nil)
        XCTAssertEqual(message.role, .system)
        XCTAssertEqual(message.content, "Test")
        XCTAssertEqual(message.name, nil)
    }
    
    func testInitWhenNameIsNotNil() {
        let message = SwiftyGPTSystemMessage(content: "Test", name: "Test")
        XCTAssertEqual(message.role, .system)
        XCTAssertEqual(message.content, "Test")
        XCTAssertEqual(message.name, "Test")
    }
}
