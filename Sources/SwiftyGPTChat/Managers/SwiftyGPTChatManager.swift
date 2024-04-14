//
//  SwiftyGPTChatManager.swift
//
//
//  Created by Antonio Guerra on 14/04/24.
//

import Foundation

struct SwiftyGPTChatManager {
    private let service: SwiftyGPTChatService
    
    init(service: SwiftyGPTChatService) {
        self.service = service
    }
    
    func send(messages: [any SwiftyGPTChatMessage], model: SwiftyGPTChatModel, frequencyPenalty: Double? = 0, logprobs: Bool? = false, topLogprobs: Int? = nil, maxTokens: Int? = nil, n: Int? = 1, presencePenalty: Double? = 0, seed: Int? = nil, temperature: Double? = 1, topP: Double? = 1, user: String? = nil) async throws -> SwiftyGPTChatResponse {
        let requestBody = SwiftyGPTChatRequestBody(messages: messages, model: model, frequencyPenalty: frequencyPenalty, logprobs: logprobs, topLogprobs: topLogprobs, maxTokens: maxTokens, n: n, presencePenalty: presencePenalty, seed: seed, temperature: temperature, topP: topP, user: user)
        let responseBody = try await service.request(body: requestBody)
        switch responseBody {
        case let body as SwiftyGPTChatResponseSuccessBody:
            return .success(body: body)
        case let body as SwiftyGPTChatResponseFailureBody:
            return .failure(body: body)
        default:
            throw URLError(.cannotParseResponse)
        }
    }
}
