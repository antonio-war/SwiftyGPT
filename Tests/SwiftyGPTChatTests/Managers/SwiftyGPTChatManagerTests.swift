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
        let mockedResponseBody = SwiftyGPTChatResponseSuccessBody(id: "Test", created: 0.0, model: .gpt3_5_turbo, fingerprint: "Test", object: "Test")
        let service = SwiftyGPTChatMockService(responseBody: mockedResponseBody)
        let manager = SwiftyGPTChatManager(service: service)
        let response = try await manager.send(messages: [], model: .gpt3_5_turbo)
        XCTAssertEqual(response, .success(body: mockedResponseBody))
    }
}
