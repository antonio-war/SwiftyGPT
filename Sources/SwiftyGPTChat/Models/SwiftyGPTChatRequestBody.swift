//
//  SwiftyGPTChatRequestBody.swift
//
//
//  Created by Antonio Guerra on 11/04/24.
//

import Foundation

struct SwiftyGPTChatRequestBody: Encodable {
    let model: SwiftyGPTChatModel
    let messages: [SwiftyGPTChatMessage]
    let frequencyPenalty: Double?
    // TODO: add logit_bias
    let logprobs: Bool?
    let topLogprobs: Int?
    let maxTokens: Int?
    let choices: Int?
    let presencePenalty: Double?
    // TODO: add response_format
    let seed: Int?
    // TODO: add stop
    // TODO: add stream
    let temperature: Double?
    let nucleusSampling: Double?
    // TODO: add tools
    let user: String?
        
    var encodedMessages: [SwiftyGPTChatEncodedMessage] {
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
        
    enum CodingKeys: CodingKey {
        case model
//        case messages
        case frequencyPenalty
        case logprobs
        case topLogprobs
        case maxTokens
        case choices
        case presencePenalty
        case seed
        case temperature
        case nucleusSampling
        case user
    }
}
