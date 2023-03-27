//
//  SwiftyGPTResponse.swift
//  
//
//  Created by Antonio Guerra on 27/03/23.
//

import Foundation
import SwiftyHTTP

struct SwiftyGPTResponse: SwiftyHTTPBody {
    let id, object: String
    let created: TimeInterval
    let model: SwiftyGPTModel
    let usage: SwiftyGPTUsage
    let choices: [SwiftyGPTChoice]
}

// MARK: - Choice
struct SwiftyGPTChoice: Codable {
    let message: SwiftyGPTMessage
    let finishReason: SwiftyGPTFinishReason
    let index: Int

    enum CodingKeys: String, CodingKey {
        case message
        case finishReason = "finish_reason"
        case index
    }
}

// MARK: - Usage
struct SwiftyGPTUsage: Codable {
    let promptTokens, completionTokens, totalTokens: Int

    enum CodingKeys: String, CodingKey {
        case promptTokens = "prompt_tokens"
        case completionTokens = "completion_tokens"
        case totalTokens = "total_tokens"
    }
}

// MARK: - FinishReason
enum SwiftyGPTFinishReason: String, Codable {
    case stop
    case length
    case contentFilter = "content_filter"
    case null
}
