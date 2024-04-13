//
//  SwiftyGPTChatRequestBody.swift
//
//
//  Created by Antonio Guerra on 11/04/24.
//

import Foundation

struct SwiftyGPTChatRequestBody: Encodable {
    let messages: [any SwiftyGPTChatMessage]
    let model: SwiftyGPTChatModel
    let frequencyPenalty: Double?
    // TODO: add logit_bias
    let logprobs: Bool?
    let topLogprobs: Int?
    let maxTokens: Int?
    let n: Int?
    let presencePenalty: Double?
    // TODO: add response_format
    let seed: Int?
    // TODO: add stop
    // TODO: add stream
    let temperature: Double?
    let topP: Double?
    // TODO: add tools
    let user: String?
        
    var codableMessages: [SwiftyGPTChatCodableMessage] {
        return messages.compactMap {
            switch $0 {
            case let message as SwiftyGPTChatSystemMessage:
                return .system(message)
            case let message as SwiftyGPTChatUserMessage:
                return .user(message)
            case let message as SwiftyGPTChatAssistantMessage:
                return .assistant(message)
            case let message as SwiftyGPTChatToolMessage:
                return .tool(message)
            default:
                return .none
            }
        }
    }
     
    init(messages: [any SwiftyGPTChatMessage], model: SwiftyGPTChatModel, frequencyPenalty: Double? = 0, logprobs: Bool? = false, topLogprobs: Int? = nil, maxTokens: Int? = nil, n: Int? = 1, presencePenalty: Double? = 0, seed: Int? = nil, temperature: Double? = 1, topP: Double? = 1, user: String? = nil) {
        self.messages = messages
        self.model = model
        self.frequencyPenalty = frequencyPenalty
        self.logprobs = logprobs
        self.topLogprobs = topLogprobs
        self.maxTokens = maxTokens
        self.n = n
        self.presencePenalty = presencePenalty
        self.seed = seed
        self.temperature = temperature
        self.topP = topP
        self.user = user
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(model, forKey: .model)
        try container.encode(codableMessages, forKey: .messages)
        try container.encodeIfPresent(frequencyPenalty, forKey: .frequencyPenalty)
        try container.encodeIfPresent(logprobs, forKey: .logprobs)
        try container.encodeIfPresent(topLogprobs, forKey: .topLogprobs)
        try container.encodeIfPresent(maxTokens, forKey: .maxTokens)
        try container.encodeIfPresent(n, forKey: .n)
        try container.encodeIfPresent(presencePenalty, forKey: .presencePenalty)
        try container.encodeIfPresent(seed, forKey: .seed)
        try container.encodeIfPresent(temperature, forKey: .temperature)
        try container.encodeIfPresent(topP, forKey: .topP)
        try container.encodeIfPresent(user, forKey: .user)
    }
    
    enum CodingKeys: String, CodingKey {
        case messages
        case model
        case frequencyPenalty = "frequency_penalty"
        case logprobs
        case topLogprobs = "top_logprobs"
        case maxTokens = "max_tokens"
        case n = "n"
        case presencePenalty = "presence_penalty"
        case seed
        case temperature
        case topP = "top_p"
        case user
    }
}
