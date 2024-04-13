//
//  SwiftyGPTChatNetworkingService.swift
//
//
//  Created by Antonio Guerra on 13/04/24.
//

import Foundation

struct SwiftyGPTChatNetworkingService: SwiftyGPTChatService {
    private let apiKey: String
    private let organization: String?
    
    func send(_ request: SwiftyGPTChatRequestBody) async throws -> SwiftyGPTChatResponseBody {
        return SwiftyGPTChatResponseBody(id: "", created: Date(), model: .gpt3_5_turbo, fingerprint: "", object: "")
    }
}
