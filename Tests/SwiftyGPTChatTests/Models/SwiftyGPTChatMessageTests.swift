//
//  SwiftyGPTChatMessageTests.swift
//  
//
//  Created by Antonio Guerra on 11/04/24.
//

@testable import SwiftyGPTChat
import XCTest

final class SwiftyGPTChatMessageTests: XCTestCase {
    
    var encoder: JSONEncoder!
    
    override func setUpWithError() throws {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .sortedKeys
        self.encoder = encoder
    }
    
    override func tearDownWithError() throws {
        self.encoder = nil
    }
    
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
    
    func testSystemMessageEncodeWhenNameIsNil() throws {
        let message = SwiftyGPTChatSystemMessage(content: "Test")
        let encodedMessage = try encoder.encode(message)
        let encodedString = String(data: encodedMessage, encoding: .utf8)
        let expectedString = "{\"content\":\"Test\",\"role\":\"system\"}"
        XCTAssertEqual(encodedString, expectedString)
    }
    
    func testSystemMessageEncodeWhenNameIsNotNil() throws {
        let message = SwiftyGPTChatSystemMessage(content: "Test", name: "Test")
        let encodedMessage = try encoder.encode(message)
        let encodedString = String(data: encodedMessage, encoding: .utf8)
        let expectedString = "{\"content\":\"Test\",\"name\":\"Test\",\"role\":\"system\"}"
        XCTAssertEqual(encodedString, expectedString)
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
    
    func testUserMessageEncodeWhenNameIsNil() throws {
        let message = SwiftyGPTChatUserMessage(content: "Test")
        let encodedMessage = try encoder.encode(message)
        let encodedString = String(data: encodedMessage, encoding: .utf8)
        let expectedString = "{\"content\":\"Test\",\"role\":\"user\"}"
        XCTAssertEqual(encodedString, expectedString)
    }
    
    func testUserMessageEncodeWhenNameIsNotNil() throws {
        let message = SwiftyGPTChatUserMessage(content: "Test", name: "Test")
        let encodedMessage = try encoder.encode(message)
        let encodedString = String(data: encodedMessage, encoding: .utf8)
        let expectedString = "{\"content\":\"Test\",\"name\":\"Test\",\"role\":\"user\"}"
        XCTAssertEqual(encodedString, expectedString)
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
    
    func testAssistanteMessageEncodeWhenNameIsNil() throws {
        let message = SwiftyGPTChatAssistantMessage(content: "Test")
        let encodedMessage = try encoder.encode(message)
        let encodedString = String(data: encodedMessage, encoding: .utf8)
        let expectedString = "{\"content\":\"Test\",\"role\":\"assistant\"}"
        XCTAssertEqual(encodedString, expectedString)
    }
    
    func testAssistantMessageEncodeWhenNameIsNotNil() throws {
        let message = SwiftyGPTChatAssistantMessage(content: "Test", name: "Test")
        let encodedMessage = try encoder.encode(message)
        let encodedString = String(data: encodedMessage, encoding: .utf8)
        let expectedString = "{\"content\":\"Test\",\"name\":\"Test\",\"role\":\"assistant\"}"
        XCTAssertEqual(encodedString, expectedString)
    }
    
    func testToolMessageInit() throws {
        let message = SwiftyGPTChatToolMessage(content: "Test")
        XCTAssertEqual(message.role, .tool)
        XCTAssertEqual(message.content, "Test")
    }
    
    func testToolMessageEncode() throws {
        let message = SwiftyGPTChatToolMessage(content: "Test")
        let encodedMessage = try encoder.encode(message)
        let encodedString = String(data: encodedMessage, encoding: .utf8)
        let expectedString = "{\"content\":\"Test\",\"role\":\"tool\"}"
        XCTAssertEqual(encodedString, expectedString)
    }
    
    func testCodableMessageEncodeWhenRoleIsSystem() throws {
        let message = SwiftyGPTChatCodableMessage.system(SwiftyGPTChatSystemMessage(content: "Test"))
        let encodedMessage = try encoder.encode(message)
        let encodedString = String(data: encodedMessage, encoding: .utf8)
        let expectedString = "{\"content\":\"Test\",\"role\":\"system\"}"
        XCTAssertEqual(encodedString, expectedString)
    }
    
    func testCodableMessageEncodeWhenRoleIsUser() throws {
        let message = SwiftyGPTChatCodableMessage.user(SwiftyGPTChatUserMessage(content: "Test"))
        let encodedMessage = try encoder.encode(message)
        let encodedString = String(data: encodedMessage, encoding: .utf8)
        let expectedString = "{\"content\":\"Test\",\"role\":\"user\"}"
        XCTAssertEqual(encodedString, expectedString)
    }
    
    func testCodableMessageEncodeWhenRoleIsAssistant() throws {
        let message = SwiftyGPTChatCodableMessage.assistant(SwiftyGPTChatAssistantMessage(content: "Test"))
        let encodedMessage = try encoder.encode(message)
        let encodedString = String(data: encodedMessage, encoding: .utf8)
        let expectedString = "{\"content\":\"Test\",\"role\":\"assistant\"}"
        XCTAssertEqual(encodedString, expectedString)
    }
    
    func testCodableMessageEncodeWhenRoleIsTool() throws {
        let message = SwiftyGPTChatCodableMessage.tool(SwiftyGPTChatToolMessage(content: "Test"))
        let encodedMessage = try encoder.encode(message)
        let encodedString = String(data: encodedMessage, encoding: .utf8)
        let expectedString = "{\"content\":\"Test\",\"role\":\"tool\"}"
        XCTAssertEqual(encodedString, expectedString)
    }
}
