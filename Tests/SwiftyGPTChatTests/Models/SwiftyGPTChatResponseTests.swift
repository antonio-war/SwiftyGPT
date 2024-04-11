//
//  SwiftyGPTChatResponseTests.swift
//  
//
//  Created by Antonio Guerra on 11/04/24.
//

@testable import SwiftyGPTChat
import XCTest

final class SwiftyGPTChatResponseTests: XCTestCase {
    
    func testDecoding() throws {
        let json = """
            {
              "id": "chatcmpl-123",
              "object": "chat.completion",
              "created": 1677652288,
              "model": "gpt-3.5-turbo-0125",
              "system_fingerprint": "fp_44709d6fcb",
              "choices": [{
                "index": 0,
                "message": {
                  "role": "assistant",
                  "content": "\n\nHello there, how may I assist you today?",
                },
                "logprobs": null,
                "finish_reason": "stop"
              }],
              "usage": {
                "prompt_tokens": 9,
                "completion_tokens": 12,
                "total_tokens": 21
              }
            }
        """
        let data = try XCTUnwrap(json.data(using: .utf8))
        let decoder = JSONDecoder()
        let response = try decoder.decode(SwiftyGPTChatResponse.self, from: data)
        XCTAssertEqual(response.id, "chatcmpl-123")
        XCTAssertEqual(response.object, "chat.completion")
        XCTAssertEqual(response.created, Date(timeIntervalSince1970: 1677652288))
        XCTAssertEqual(response.model, .gpt3_5_turbo_0125)
        XCTAssertEqual(response.fingerprint, "fp_44709d6fcb")
    }
}
