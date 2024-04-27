//
//  SwiftyGPTChatResponseTests.swift
//  
//
//  Created by Antonio Guerra on 15/04/24.
//

@testable import SwiftyGPTChat
import XCTest

final class SwiftyGPTChatResponseTests: XCTestCase {
    
    func testInitWhenBodyIsSuccess() throws {
        let body = SwiftyGPTChatResponseSuccessBody(id: "Test", choices: [], created: 0.0, model: .gpt3_5_turbo, fingerprint: "Test", object: .completion, usage: SwiftyGPTChatResponseTokenUsage(completion: 0, prompt: 0, total: 0))
        let response = try SwiftyGPTChatResponse(body: body)
        XCTAssertEqual(response, .success(body: body))
    }
    
    func testInitWhenBodyIsFailure() throws {
        let body = SwiftyGPTChatResponseFailureBody(error: SwiftyGPTChatResponseError(type: "Test", message: "Test"))
        let response = try SwiftyGPTChatResponse(body: body)
        XCTAssertEqual(response, .failure(body: body))
    }
    
    func testInitWhenBodyIsUnknown() throws {
        let body = SwiftyGPTChatResponseUnknownBody()
        XCTAssertThrowsError(try SwiftyGPTChatResponse(body: body))
    }
    
    struct SwiftyGPTChatResponseUnknownBody: SwiftyGPTChatResponseBody {}
}

