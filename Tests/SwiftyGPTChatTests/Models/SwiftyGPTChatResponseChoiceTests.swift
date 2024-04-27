//
//  SwiftyGPTChatResponseChoiceTests.swift
//  
//
//  Created by Antonio Guerra on 27/04/24.
//

import XCTest
@testable import SwiftyGPTChat

final class SwiftyGPTChatResponseChoiceTests: XCTestCase {
    
    var decoder: JSONDecoder!
    
    override func setUpWithError() throws {
        self.decoder = JSONDecoder()
    }
    
    override func tearDownWithError() throws {
        self.decoder = nil
    }
    
    func testInitWhenMessageIsSystem() throws {
        let message = SwiftyGPTChatSystemMessage(content: "test")
        let choice = SwiftyGPTChatResponseChoice(index: 0, codableMessage: .system(message), finishReason: .stop)
        let systemMessage = try XCTUnwrap(choice.message as? SwiftyGPTChatSystemMessage)
        XCTAssertEqual(choice.index, 0)
        XCTAssertEqual(choice.codableMessage, .system(message))
        XCTAssertEqual(systemMessage, message)
        XCTAssertEqual(choice.finishReason, .stop)
    }
    
    func testDecodeWhenMessageIsSystem() throws {
        let json = """
        {
          "index": 0,
          "message": {
            "role": "system",
            "content": "test"
          },
          "finish_reason": "stop"
        }
        """
        let data = try XCTUnwrap(json.data(using: .utf8))
        let choice = try decoder.decode(SwiftyGPTChatResponseChoice.self, from: data)
        let message = SwiftyGPTChatSystemMessage(content: "test")
        XCTAssertEqual(choice.index, 0)
        XCTAssertEqual(choice.codableMessage, .system(message))
        let systemMessage = try XCTUnwrap(choice.message as? SwiftyGPTChatSystemMessage)
        XCTAssertEqual(systemMessage, message)
        XCTAssertEqual(choice.finishReason, .stop)
    }
    
    func testInitWhenMessageIsAssistant() throws {
        let message = SwiftyGPTChatAssistantMessage(content: "test")
        let choice = SwiftyGPTChatResponseChoice(index: 0, codableMessage: .assistant(message), finishReason: .stop)
        let assistantMessage = try XCTUnwrap(choice.message as? SwiftyGPTChatAssistantMessage)
        XCTAssertEqual(choice.index, 0)
        XCTAssertEqual(choice.codableMessage, .assistant(message))
        XCTAssertEqual(assistantMessage, message)
        XCTAssertEqual(choice.finishReason, .stop)
    }
    
    func testDecodeWhenMessageIsAssistant() throws {
        let json = """
        {
          "index": 0,
          "message": {
            "role": "assistant",
            "content": "test"
          },
          "finish_reason": "stop"
        }
        """
        let data = try XCTUnwrap(json.data(using: .utf8))
        let choice = try decoder.decode(SwiftyGPTChatResponseChoice.self, from: data)
        let message = SwiftyGPTChatAssistantMessage(content: "test")
        XCTAssertEqual(choice.index, 0)
        XCTAssertEqual(choice.codableMessage, .assistant(message))
        let assistantMessage = try XCTUnwrap(choice.message as? SwiftyGPTChatAssistantMessage)
        XCTAssertEqual(assistantMessage, message)
        XCTAssertEqual(choice.finishReason, .stop)
    }
    
    func testInitWhenMessageIsUser() throws {
        let message = SwiftyGPTChatUserMessage(content: "test")
        let choice = SwiftyGPTChatResponseChoice(index: 0, codableMessage: .user(message), finishReason: .stop)
        let userMessage = try XCTUnwrap(choice.message as? SwiftyGPTChatUserMessage)
        XCTAssertEqual(choice.index, 0)
        XCTAssertEqual(choice.codableMessage, .user(message))
        XCTAssertEqual(userMessage, message)
        XCTAssertEqual(choice.finishReason, .stop)
    }
    
    func testDecodeWhenMessageIsUser() throws {
        let json = """
        {
          "index": 0,
          "message": {
            "role": "user",
            "content": "test"
          },
          "finish_reason": "stop"
        }
        """
        let data = try XCTUnwrap(json.data(using: .utf8))
        let choice = try decoder.decode(SwiftyGPTChatResponseChoice.self, from: data)
        let message = SwiftyGPTChatUserMessage(content: "test")
        XCTAssertEqual(choice.index, 0)
        XCTAssertEqual(choice.codableMessage, .user(message))
        let userMessage = try XCTUnwrap(choice.message as? SwiftyGPTChatUserMessage)
        XCTAssertEqual(userMessage, message)
        XCTAssertEqual(choice.finishReason, .stop)
    }
    
    func testInitWhenMessageIsTool() throws {
        let message = SwiftyGPTChatToolMessage(content: "test")
        let choice = SwiftyGPTChatResponseChoice(index: 0, codableMessage: .tool(message), finishReason: .stop)
        let toolMessage = try XCTUnwrap(choice.message as? SwiftyGPTChatToolMessage)
        XCTAssertEqual(choice.index, 0)
        XCTAssertEqual(choice.codableMessage, .tool(message))
        XCTAssertEqual(toolMessage, message)
        XCTAssertEqual(choice.finishReason, .stop)
    }
    
    func testDecodeWhenMessageIsTool() throws {
        let json = """
        {
          "index": 0,
          "message": {
            "role": "tool",
            "content": "test"
          },
          "finish_reason": "stop"
        }
        """
        let data = try XCTUnwrap(json.data(using: .utf8))
        let choice = try decoder.decode(SwiftyGPTChatResponseChoice.self, from: data)
        let message = SwiftyGPTChatToolMessage(content: "test")
        XCTAssertEqual(choice.index, 0)
        XCTAssertEqual(choice.codableMessage, .tool(message))
        let toolMessage = try XCTUnwrap(choice.message as? SwiftyGPTChatToolMessage)
        XCTAssertEqual(toolMessage, message)
        XCTAssertEqual(choice.finishReason, .stop)
    }
}
