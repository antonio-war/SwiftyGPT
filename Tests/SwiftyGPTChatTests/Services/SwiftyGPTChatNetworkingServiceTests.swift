//
//  SwiftyGPTChatNetworkingServiceTests.swift
//
//
//  Created by Antonio Guerra on 14/04/24.
//

@testable import SwiftyGPTChat
import XCTest

final class SwiftyGPTChatNetworkingServiceTests: XCTestCase {
    
    func testRequestWhenApiKeyIsValid() async throws {
        let service = SwiftyGPTChatNetworkingService(apiKey: "TestApi")
        let requestBody = SwiftyGPTChatRequestBody(messages: [
            SwiftyGPTChatSystemMessage(content: "You are an helpful assistant"),
            SwiftyGPTChatUserMessage(content: "Hello!")
        ], model: .gpt3_5_turbo)
        let genericResponseBody = try await service.request(body: requestBody)
        let successResponseBody = try XCTUnwrap(genericResponseBody as? SwiftyGPTChatResponseSuccessBody)
        print(successResponseBody)
    }
}
