//
//  SwiftyGPTChatMockServiceTests.swift
//
//
//  Created by Antonio Guerra on 14/04/24.
//

@testable import SwiftyGPTChat
import XCTest

final class SwiftyGPTChatMockServiceTests: XCTestCase {
    
    func testRequestWhenResponseIsSuccessful() async throws {
        let mockedResponseBody = SwiftyGPTChatResponseSuccessBody(id: "Test", created: 0.0, model: .gpt3_5_turbo, fingerprint: "Test", object: "Test")
        let service = SwiftyGPTChatMockService(responseBody: mockedResponseBody)
        let requestBody = SwiftyGPTChatRequestBody(messages: [], model: .gpt3_5_turbo)
        let genericResponseBody = try await service.request(body: requestBody)
        let successResponseBody = try XCTUnwrap(genericResponseBody as? SwiftyGPTChatResponseSuccessBody)
        XCTAssertEqual(mockedResponseBody, successResponseBody)
    }
}

