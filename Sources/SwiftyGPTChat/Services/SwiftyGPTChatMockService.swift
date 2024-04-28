//
//  SwiftyGPTChatMockService.swift
//
//
//  Created by Antonio Guerra on 13/04/24.
//

import Foundation

public class SwiftyGPTChatMockService: SwiftyGPTChatService {
    let responseBody: any SwiftyGPTChatResponseBody
    let duration: TimeInterval
    
    private (set) public var requestCallCount: Int = 0
    public var requestCalled: Bool {
        return requestCallCount > 0
    }
    
    public init(responseBody: any SwiftyGPTChatResponseBody, duration: TimeInterval = 0.0) {
        self.responseBody = responseBody
        self.duration = duration
    }
    
    public func request(body: SwiftyGPTChatRequestBody) async throws -> any SwiftyGPTChatResponseBody {
        try await Task.sleep(nanoseconds: UInt64(duration * 1_000_000_000))
        requestCallCount += 1
        return responseBody
    }
}
