//
//  SwiftyGPTChatService.swift
//
//
//  Created by Antonio Guerra on 13/04/24.
//

import Foundation

public protocol SwiftyGPTChatService {
    func request(body: SwiftyGPTChatRequestBody) async throws -> any SwiftyGPTChatResponseBody
}
