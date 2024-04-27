//
//  SwiftyGPTChatNetworkingServiceTests.swift
//  
//
//  Created by Antonio Guerra on 26/04/24.
//

import XCTest
@testable import SwiftyGPTChat
@testable import SwiftyGPTNetworking

final class SwiftyGPTChatNetworkingServiceTests: XCTestCase {
            
    func testInit() {
        let client = SwiftyGPTNetworkingClient()
        let apiKey = "testApiKey"
        let organization = "testOrganization"
        let service = SwiftyGPTChatNetworkingService(client: client, apiKey: apiKey, organization: organization)
        XCTAssertEqual(service.client, client)
        XCTAssertEqual(service.apiKey, apiKey)
        XCTAssertEqual(service.organization, organization)
    }
    
    func testRequestWhenApiKeyIsValid() async throws {
        let apiKey = try XCTUnwrap(ProcessInfo.processInfo.environment["OPEN_AI_API_KEY"])
        let service = SwiftyGPTChatNetworkingService(apiKey: apiKey)
        let requestBody = SwiftyGPTChatRequestBody(messages: [SwiftyGPTChatUserMessage(content: "Hello world!")], model: .gpt3_5_turbo, n: 1)
        let responseBody = try await service.request(body: requestBody)
        let successBody = try XCTUnwrap(responseBody as? SwiftyGPTChatResponseSuccessBody)
        XCTAssertEqual(successBody.choices.count, 1)
        XCTAssertEqual(successBody.object, .completion)
    }
    
    func testRequestWhenApiKeyIsNotValid() async throws {
        let apiKey = try XCTUnwrap(ProcessInfo.processInfo.environment["OPEN_AI_INVALID_API_KEY"])
        let service = SwiftyGPTChatNetworkingService(apiKey: apiKey)
        let requestBody = SwiftyGPTChatRequestBody(messages: [SwiftyGPTChatUserMessage(content: "Hello world!")], model: .gpt3_5_turbo, n: 1)
        let responseBody = try await service.request(body: requestBody)
        let failureBody = try XCTUnwrap(responseBody as? SwiftyGPTChatResponseFailureBody)
        XCTAssertEqual(failureBody.error.type, "invalid_request_error")
    }
}
