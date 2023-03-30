//
//  SwiftyGPTChatResponse.swift
//  
//
//  Created by Antonio Guerra on 27/03/23.
//

import Foundation
import SwiftyHTTP

public struct SwiftyGPTChatResponse: SwiftyHTTPResponseBody {
    public let id, object: String
    public let created: TimeInterval
    public let model: SwiftyGPTChatModel
    public let usage: SwiftyGPTChatUsage
    public let choices: [SwiftyGPTChatChoice]
}

// MARK: - Choice
public struct SwiftyGPTChatChoice: Codable {
    public let message: SwiftyGPTChatMessage
    public let finishReason: SwiftyGPTChatFinishReason
    public let index: Int

    enum CodingKeys: String, CodingKey {
        case message
        case finishReason = "finish_reason"
        case index
    }
}

// MARK: - Usage
public struct SwiftyGPTChatUsage: Codable {
    public let promptTokens, completionTokens, totalTokens: Int

    enum CodingKeys: String, CodingKey {
        case promptTokens = "prompt_tokens"
        case completionTokens = "completion_tokens"
        case totalTokens = "total_tokens"
    }
}

// MARK: - FinishReason
public enum SwiftyGPTChatFinishReason: String, Codable {
    case stop
    case length
    case contentFilter = "content_filter"
    case null
}
