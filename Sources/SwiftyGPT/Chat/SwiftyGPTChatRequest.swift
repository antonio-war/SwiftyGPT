//
//  SwiftyGPTChatRequest.swift
//  
//
//  Created by Antonio Guerra on 27/03/23.
//

import Foundation
import SwiftyHTTP

public struct SwiftyGPTChatRequest: SwiftyGPTRequest {
    public let messages: [SwiftyGPTChatMessage]
    public let model: SwiftyGPTChatModel
    public let temperature: Float?
    public let choices: Int?
    public let stream: Bool?
    public let maxTokens: Int?
    public let presencePenalty: Float?
    public let frequencyPenalty: Float?
    public let user: String?
    
    enum CodingKeys: String, CodingKey {
        case model
        case messages
        case temperature
        case choices = "n"
        case stream
        case maxTokens = "max_tokens"
        case presencePenalty = "presence_penalty"
        case frequencyPenalty = "frequency_penalty"
        case user
    }
}
