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
            SwiftyGPTSystemMessage(content: "Test"),
            SwiftyGPTAssistantMessage(content: "Test"),
            SwiftyGPTUserMessage(content: "Test"),
            SwiftyGPTToolMessage(content: "Test")
        ], model: .gpt3_5_turbo)
        
        XCTAssertEqual(requestBody.codableMessages.count, 4)
        XCTAssertEqual(requestBody.codableMessages[0], .system(SwiftyGPTSystemMessage(content: "Test")))
        XCTAssertEqual(requestBody.codableMessages[1], .assistant(SwiftyGPTAssistantMessage(content: "Test")))
        XCTAssertEqual(requestBody.codableMessages[2], .user(SwiftyGPTUserMessage(content: "Test")))
        XCTAssertEqual(requestBody.codableMessages[3], .tool(SwiftyGPTToolMessage(content: "Test")))
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


