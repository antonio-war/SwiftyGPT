//
//  SwiftyGPTChatMockService.swift
//
//
//  Created by Antonio Guerra on 13/04/24.
//

import Foundation

struct SwiftyGPTChatMockService: SwiftyGPTChatService {
    private let responseBody: SwiftyGPTChatResponseBody
    
    init(responseBody: SwiftyGPTChatResponseBody) {
        self.responseBody = responseBody
    }
    
    func request(body: SwiftyGPTChatRequestBody) async throws -> SwiftyGPTChatResponseBody {
        return responseBody
    }
}
