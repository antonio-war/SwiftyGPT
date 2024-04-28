//
//  SwiftyGPTChatRequestBody.swift
//
//
//  Created by Antonio Guerra on 11/04/24.
//

import Foundation

public struct SwiftyGPTChatRequestBody: Encodable {
    public let messages: [any SwiftyGPTChatMessage]
    public let model: SwiftyGPTChatModel
    public let frequencyPenalty: Double?
    public let logitBias: [Int: Int]?
    public let logprobs: Bool?
    public let topLogprobs: Int?
    public let maxTokens: Int?
    public let n: Int?
    public let presencePenalty: Double?
    public let responseFormat: SwiftyGPTChatResponseFormat?
    public let seed: Int?
    // TODO: add stop parameter support
    // TODO: add stream parameter support
    public let temperature: Double?
    public let topP: Double?
    // TODO: add tools parameter support
    // TODO: add tool_choice parameter support
    public let user: String?
        
    public init(messages: [any SwiftyGPTChatMessage], model: SwiftyGPTChatModel, frequencyPenalty: Double? = nil, logitBias: [Int: Int]? = nil, logprobs: Bool? = nil, topLogprobs: Int? = nil, maxTokens: Int? = nil, n: Int? = nil, presencePenalty: Double? = nil, responseFormat: SwiftyGPTChatResponseFormat? = nil, seed: Int? = nil, temperature: Double? = nil, topP: Double? = nil, user: String? = nil) {
        self.messages = messages
        self.model = model
        self.frequencyPenalty = frequencyPenalty
        self.logitBias = logitBias
        self.logprobs = logprobs
        self.topLogprobs = topLogprobs
        self.maxTokens = maxTokens
        self.n = n
        self.presencePenalty = presencePenalty
        self.responseFormat = responseFormat
        self.seed = seed
        self.temperature = temperature
        self.topP = topP
        self.user = user
    }
    
    var codableMessages: [SwiftyGPTChatCodableMessage] {
        return messages.map {
            switch $0 {
            case let message as SwiftyGPTChatUserMessage:
                return .user(message)
            case let message as SwiftyGPTChatAssistantMessage:
                return .assistant(message)
            case let message as SwiftyGPTChatToolMessage:
                return .tool(message)
            default:
                let message = $0 as! SwiftyGPTChatSystemMessage
                return .system(message)
            }
        }
    }
    
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(model, forKey: .model)
        try container.encode(codableMessages, forKey: .messages)
        try container.encodeIfPresent(frequencyPenalty, forKey: .frequencyPenalty)
        try container.encodeIfPresent(logitBias, forKey: .logitBias)
        try container.encodeIfPresent(logprobs, forKey: .logprobs)
        try container.encodeIfPresent(topLogprobs, forKey: .topLogprobs)
        try container.encodeIfPresent(maxTokens, forKey: .maxTokens)
        try container.encodeIfPresent(n, forKey: .n)
        try container.encodeIfPresent(presencePenalty, forKey: .presencePenalty)
        try container.encodeIfPresent(responseFormat, forKey: .responseFormat)
        try container.encodeIfPresent(seed, forKey: .seed)
        try container.encodeIfPresent(temperature, forKey: .temperature)
        try container.encodeIfPresent(topP, forKey: .topP)
        try container.encodeIfPresent(user, forKey: .user)
    }
    
    enum CodingKeys: String, CodingKey {
        case messages
        case model
        case frequencyPenalty = "frequency_penalty"
        case logitBias = "logit_bias"
        case logprobs
        case topLogprobs = "top_logprobs"
        case maxTokens = "max_tokens"
        case n = "n"
        case presencePenalty = "presence_penalty"
        case responseFormat = "response_format"
        case seed
        case temperature
        case topP = "top_p"
        case user
    }
}
