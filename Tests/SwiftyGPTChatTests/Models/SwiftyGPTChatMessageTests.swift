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
        let message = SwiftyGPTSystemMessage(content: "Test")
        XCTAssertEqual(message.role, .system)
        XCTAssertEqual(message.content, "Test")
        XCTAssertEqual(message.name, nil)
    }
    
    func testSystemMessageInitWhenNameIsNotNil() throws {
        let message = SwiftyGPTSystemMessage(content: "Test", name: "Test")
        XCTAssertEqual(message.role, .system)
        XCTAssertEqual(message.content, "Test")
        XCTAssertEqual(message.name, "Test")
    }
    
    func testUserMessageInitWhenNameIsNil() throws {
        let message = SwiftyGPTUserMessage(content: "Test")
        XCTAssertEqual(message.role, .user)
        XCTAssertEqual(message.content, "Test")
        XCTAssertEqual(message.name, nil)
    }
    
    func testUserMessageInitWhenNameIsNotNil() throws {
        let message = SwiftyGPTUserMessage(content: "Test", name: "Test")
        XCTAssertEqual(message.role, .user)
        XCTAssertEqual(message.content, "Test")
        XCTAssertEqual(message.name, "Test")
    }
    
    func testAssistantMessageInitWhenContentIsNil() throws {
        let message = SwiftyGPTAssistantMessage()
        XCTAssertEqual(message.role, .assistant)
        XCTAssertEqual(message.content, nil)
        XCTAssertEqual(message.name, nil)
    }
    
    func testUserMessageInitWhenContentIsNotNil() throws {
        let message = SwiftyGPTAssistantMessage(content: "Test")
        XCTAssertEqual(message.role, .assistant)
        XCTAssertEqual(message.content, "Test")
        XCTAssertEqual(message.name, nil)
    }
    
    func testAssistantMessageInitWhenNameIsNil() throws {
        let message = SwiftyGPTAssistantMessage()
        XCTAssertEqual(message.role, .assistant)
        XCTAssertEqual(message.content, nil)
        XCTAssertEqual(message.name, nil)
    }
    
    func testAssistantMessageInitWhenNameIsNotNil() throws {
        let message = SwiftyGPTAssistantMessage(name: "Test")
        XCTAssertEqual(message.role, .assistant)
        XCTAssertEqual(message.content, nil)
        XCTAssertEqual(message.name, "Test")
    }
    
    func testToolMessageInit() throws {
        let message = SwiftyGPTToolMessage(content: "Test")
        XCTAssertEqual(message.role, .tool)
        XCTAssertEqual(message.content, "Test")
    }
}
