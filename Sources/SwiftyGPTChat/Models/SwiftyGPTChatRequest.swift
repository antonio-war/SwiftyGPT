//
//  SwiftyGPTChatRequest.swift
//
//
//  Created by Antonio Guerra on 11/04/24.
//

import Foundation

struct SwiftyGPTChatRequest {
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
}