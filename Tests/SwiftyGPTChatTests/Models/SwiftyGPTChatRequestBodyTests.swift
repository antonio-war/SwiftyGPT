//
//  SwiftyGPTChatRequestBodyTests.swift
//
//
//  Created by Antonio Guerra on 12/04/24.
//

@testable import SwiftyGPTChat
import XCTest

final class SwiftyGPTChatRequestBodyTests: XCTestCase {
    
    func testCodableMessages() {
        let requestBody = SwiftyGPTChatRequestBody(messages: [
            SwiftyGPTChatSystemMessage(content: "Test"),
            SwiftyGPTChatAssistantMessage(content: "Test"),
            SwiftyGPTChatUserMessage(content: "Test"),
            SwiftyGPTChatToolMessage(content: "Test")
        ], model: .gpt3_5_turbo)
        
        XCTAssertEqual(requestBody.codableMessages.count, 4)
        XCTAssertEqual(requestBody.codableMessages[0], .system(SwiftyGPTChatSystemMessage(content: "Test")))
        XCTAssertEqual(requestBody.codableMessages[1], .assistant(SwiftyGPTChatAssistantMessage(content: "Test")))
        XCTAssertEqual(requestBody.codableMessages[2], .user(SwiftyGPTChatUserMessage(content: "Test")))
        XCTAssertEqual(requestBody.codableMessages[3], .tool(SwiftyGPTChatToolMessage(content: "Test")))
    }
    
    func testCodableMessagesWhenTypeIsUnknown() {
        let requestBody = SwiftyGPTChatRequestBody(messages: [
            SwiftyGPTUnknownMessage(role: .user),
        ], model: .gpt3_5_turbo)
        
        XCTAssertTrue(requestBody.codableMessages.isEmpty)
    }
    
    private struct SwiftyGPTUnknownMessage: SwiftyGPTChatMessage {
        var role: SwiftyGPTChatRole
    }
}


