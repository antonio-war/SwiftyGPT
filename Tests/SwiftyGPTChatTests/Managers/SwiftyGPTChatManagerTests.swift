//
//  SwiftyGPTChatManagerTests.swift
//  
//
//  Created by Antonio Guerra on 14/04/24.
//

@testable import SwiftyGPTChat
import XCTest

final class SwiftyGPTChatManagerTests: XCTestCase {
    
    func testRequestWhenResponseIsSuccessful() async throws {
        let mockedResponseBody = SwiftyGPTChatResponseSuccessBody(id: "Test", choices: [], created: 0.0, model: .gpt3_5_turbo, fingerprint: "Test", object: .completion, usage: SwiftyGPTChatResponseTokenUsage(completion: 0, prompt: 0, total: 0))
        let service = SwiftyGPTChatMockService(responseBody: mockedResponseBody)
        let manager = SwiftyGPTChatManager(service: service)
        let response = try await manager.send(messages: [], model: .gpt3_5_turbo)
        XCTAssertEqual(response, .success(body: mockedResponseBody))
    }
}
