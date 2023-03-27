//
//  SwiftyGPTRequest.swift
//  
//
//  Created by Antonio Guerra on 27/03/23.
//

import Foundation
import SwiftyHTTP

public struct SwiftyGPTRequest: SwiftyHTTPBody {
    let messages: [SwiftyGPTMessage]
    let model: SwiftyGPTModel
    let temperature: Float
    let choices: Int
    let stream: Bool
    let tokens: Int
    let presencePenalty: Float
    let frequencyPenalty: Float
    let user: String?
    
    enum CodingKeys: String, CodingKey {
        case model
        case messages
        case temperature
        case choices = "n"
        case stream
        case user
        case tokens = "max_tokens"
        case presencePenalty = "presence_penalty"
        case frequencyPenalty = "frequency_penalty"
    }
}
