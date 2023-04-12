//
//  SwiftyGPTCompletionRequest.swift
//  
//
//  Created by Antonio Guerra on 11/04/23.
//

import Foundation
import SwiftyHTTP

public struct SwiftyGPTCompletionRequest: SwiftyGPTRequest {
    public let prompt: String
    public let model: SwiftyGPTCompletionModel
    public let suffix: String?
    public let maxTokens: Int?
    public let temperature: Float?
    public let choices: Int?
    public let stream: Bool?
    public let logprobs: Int?
    public let echo: Bool?
    public let presencePenalty: Float?
    public let frequencyPenalty: Float?
    public let user: String?
    
    enum CodingKeys: String, CodingKey {
        case prompt
        case model
        case suffix
        case maxTokens = "max_tokens"
        case temperature
        case choices = "n"
        case stream
        case logprobs
        case echo
        case presencePenalty = "presence_penalty"
        case frequencyPenalty = "frequency_penalty"
        case user
    }
}
