//
//  SwiftyGPTChatService.swift
//
//
//  Created by Antonio Guerra on 13/04/24.
//

import Foundation

protocol SwiftyGPTChatService {
    func request(body: SwiftyGPTChatRequestBody) async throws -> SwiftyGPTChatResponseBody
}
