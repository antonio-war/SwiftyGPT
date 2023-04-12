//
//  SwiftyGPTChatResponse.swift
//  
//
//  Created by Antonio Guerra on 27/03/23.
//

import Foundation
import SwiftyHTTP

public struct SwiftyGPTChatResponse: SwiftyGPTResponse {
    public let id, object: String
    public let created: TimeInterval
    public let model: SwiftyGPTChatModel
    public let usage: SwiftyGPTUsage
    public let choices: [SwiftyGPTChatChoice]
}

// MARK: - Choice
public struct SwiftyGPTChatChoice: SwiftyGPTChoice {
    public let finishReason: SwiftyGPTFinishReason
    public let index: Int
    public let message: SwiftyGPTChatMessage

    enum CodingKeys: String, CodingKey {
        case message
        case finishReason = "finish_reason"
        case index
    }
}
