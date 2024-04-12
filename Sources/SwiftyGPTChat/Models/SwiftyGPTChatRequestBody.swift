//
//  SwiftyGPTChatRequestBody.swift
//
//
//  Created by Antonio Guerra on 11/04/24.
//

import Foundation

struct SwiftyGPTChatRequestBody: Encodable {
    let messages: [SwiftyGPTChatMessage]
    let model: SwiftyGPTChatModel
    let frequencyPenalty: Double?
    // TODO: add logit_bias
    let logProbability: LogProbability?
    let maxTokens: Int?
    let choices: Int?
    let presencePenalty: Double?
    // TODO: add response_format
    let seed: Int?
    // TODO: add stop
    // TODO: add stream
    let sampling: Sampling?
    // TODO: add tools
    let user: String?
        
    var codableMessages: [SwiftyGPTChatCodableMessage] {
        return messages.compactMap {
            switch $0 {
            case let message as SwiftyGPTSystemMessage:
                return .system(message)
            case let message as SwiftyGPTUserMessage:
                return .user(message)
            case let message as SwiftyGPTAssistantMessage:
                return .assistant(message)
            case let message as SwiftyGPTToolMessage:
                return .tool(message)
            default:
                return .none
            }
        }
    }
     
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(model, forKey: .model)
        try container.encode(codableMessages, forKey: .messages)
        try container.encodeIfPresent(frequencyPenalty, forKey: .frequencyPenalty)
        if let logProbability {
            switch logProbability {
                case .enabled(let value):
                    try container.encode(true, forKey: .logprobs)
                    try container.encode(value, forKey: .topLogprobs)
                case .disabled:
                    try container.encode(false, forKey: .logprobs)
            }
        }
        try container.encodeIfPresent(maxTokens, forKey: .maxTokens)
        try container.encodeIfPresent(choices, forKey: .choices)
        try container.encodeIfPresent(presencePenalty, forKey: .presencePenalty)
        try container.encodeIfPresent(seed, forKey: .seed)
        if let sampling {
            switch sampling {
            case .temperature(let value):
                try container.encode(value, forKey: .temperature)
            case .nucleus(let value):
                try container.encode(value, forKey: .nucleus)
            }
        }
        try container.encodeIfPresent(user, forKey: .user)
    }

    enum LogProbability {
        case enabled(Int)
        case disabled
    }
    
    enum Sampling {
        case temperature(Double)
        case nucleus(Double)
    }
    
    enum CodingKeys: String, CodingKey {
        case messages
        case model
        case frequencyPenalty = "frequency_penalty"
        case logprobs
        case topLogprobs = "top_logprobs"
        case maxTokens = "max_tokens"
        case choices = "n"
        case presencePenalty = "presence_penalty"
        case seed
        case temperature
        case nucleus = "top_p"
        case user
    }
}
