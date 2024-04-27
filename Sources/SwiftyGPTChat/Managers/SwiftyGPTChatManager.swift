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
        
    func send(messages: [any SwiftyGPTChatMessage], model: SwiftyGPTChatModel, frequencyPenalty: Double? = 0, logitBias: [Int: Int]? = nil, logprobs: Bool? = false, topLogprobs: Int? = nil, maxTokens: Int? = nil, n: Int? = 1, presencePenalty: Double? = 0, responseFormat: SwiftyGPTChatResponseFormat? = nil, seed: Int? = nil, temperature: Double? = 1, topP: Double? = 1, user: String? = nil) async throws -> SwiftyGPTChatResponse {
        let requestBody = SwiftyGPTChatRequestBody(messages: messages, model: model, frequencyPenalty: frequencyPenalty, logitBias: logitBias, logprobs: logprobs, topLogprobs: topLogprobs, maxTokens: maxTokens, n: n, presencePenalty: presencePenalty, responseFormat: responseFormat, seed: seed, temperature: temperature, topP: topP, user: user)
        let responseBody = try await service.request(body: requestBody)
        return try SwiftyGPTChatResponse(body: responseBody)
    }
}
