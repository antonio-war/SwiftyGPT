//
//  SwiftyGPTResponse.swift
//  
//
//  Created by Antonio Guerra on 27/03/23.
//

import Foundation
import SwiftyHTTP

public struct SwiftyGPTResponse: SwiftyHTTPBody {
    public let id, object: String
    public let created: TimeInterval
    public let model: SwiftyGPTModel
    public let usage: SwiftyGPTUsage
    public let choices: [SwiftyGPTChoice]
}

// MARK: - Choice
public struct SwiftyGPTChoice: Codable {
    public let message: SwiftyGPTMessage
    public let finishReason: SwiftyGPTFinishReason
    public let index: Int

    enum CodingKeys: String, CodingKey {
        case message
        case finishReason = "finish_reason"
        case index
    }
}

// MARK: - Usage
public struct SwiftyGPTUsage: Codable {
    public let promptTokens, completionTokens, totalTokens: Int

    enum CodingKeys: String, CodingKey {
        case promptTokens = "prompt_tokens"
        case completionTokens = "completion_tokens"
        case totalTokens = "total_tokens"
    }
}

// MARK: - FinishReason
public enum SwiftyGPTFinishReason: String, Codable {
    case stop
    case length
    case contentFilter = "content_filter"
    case null
}
