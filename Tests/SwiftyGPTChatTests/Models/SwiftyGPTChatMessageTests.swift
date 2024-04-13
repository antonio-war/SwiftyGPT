//
//  SwiftyGPTChatMessageTests.swift
//  
//
//  Created by Antonio Guerra on 11/04/24.
//

@testable import SwiftyGPTChat
import XCTest

final class SwiftyGPTChatMessageTests: XCTestCase {
    
    func testSystemMessageInitWhenNameIsNil() throws {
        let message = SwiftyGPTChatSystemMessage(content: "Test")
        XCTAssertEqual(message.role, .system)
        XCTAssertEqual(message.content, "Test")
        XCTAssertEqual(message.name, nil)
    }
    
    func testSystemMessageInitWhenNameIsNotNil() throws {
        let message = SwiftyGPTChatSystemMessage(content: "Test", name: "Test")
        XCTAssertEqual(message.role, .system)
        XCTAssertEqual(message.content, "Test")
        XCTAssertEqual(message.name, "Test")
    }
    
    func testUserMessageInitWhenNameIsNil() throws {
        let message = SwiftyGPTChatUserMessage(content: "Test")
        XCTAssertEqual(message.role, .user)
        XCTAssertEqual(message.content, "Test")
        XCTAssertEqual(message.name, nil)
    }
    
    func testUserMessageInitWhenNameIsNotNil() throws {
        let message = SwiftyGPTChatUserMessage(content: "Test", name: "Test")
        XCTAssertEqual(message.role, .user)
        XCTAssertEqual(message.content, "Test")
        XCTAssertEqual(message.name, "Test")
    }
    
    func testAssistantMessageInitWhenNameIsNil() throws {
        let message = SwiftyGPTChatAssistantMessage(content: "Test")
        XCTAssertEqual(message.role, .assistant)
        XCTAssertEqual(message.content, "Test")
        XCTAssertEqual(message.name, nil)
    }
    
    func testAssistantMessageInitWhenNameIsNotNil() throws {
        let message = SwiftyGPTChatAssistantMessage(content: "Test", name: "Test")
        XCTAssertEqual(message.role, .assistant)
        XCTAssertEqual(message.content, "Test")
        XCTAssertEqual(message.name, "Test")
    }
    
    func testToolMessageInit() throws {
        let message = SwiftyGPTChatToolMessage(content: "Test")
        XCTAssertEqual(message.role, .tool)
        XCTAssertEqual(message.content, "Test")
    }
}
