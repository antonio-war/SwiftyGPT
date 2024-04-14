//
//  SwiftyGPTChatMockService.swift
//
//
//  Created by Antonio Guerra on 13/04/24.
//

import Foundation

struct SwiftyGPTChatMockService: SwiftyGPTChatService {
    private let responseBody: any SwiftyGPTChatResponseBody
    private let duration: TimeInterval
    
    init(responseBody: any SwiftyGPTChatResponseBody, duration: TimeInterval = 0.0) {
        self.responseBody = responseBody
        self.duration = duration
    }
    
    func request(body: SwiftyGPTChatRequestBody) async throws -> any SwiftyGPTChatResponseBody {
        try await Task.sleep(nanoseconds: UInt64(duration) * 1_000_000_000)
        return responseBody
    }
}
