//
//  SwiftyGPTChatService.swift
//
//
//  Created by Antonio Guerra on 13/04/24.
//

import Foundation

protocol SwiftyGPTChatService {
    func send(_ request: SwiftyGPTChatRequestBody) async throws -> SwiftyGPTChatResponseBody
}
