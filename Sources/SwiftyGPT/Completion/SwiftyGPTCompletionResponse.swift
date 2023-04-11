//
//  SwiftyGPTCompletionResponse.swift
//  
//
//  Created by Antonio Guerra on 11/04/23.
//

import Foundation

public struct SwiftyGPTCompletionResponse: SwiftyGPTResponse {
    public let id: String
    public let object: String
    public let created: TimeInterval
    public let usage: SwiftyGPTUsage
    public let model: SwiftyGPTCompletionModel
    public let choices: [SwiftyGPTCompletionChoice]
}

// MARK: - Choice
public struct SwiftyGPTCompletionChoice: SwiftyGPTChoice {
    public let finishReason: SwiftyGPTFinishReason
    public let index: Int
    public let text: String
    public let logprobs: Int?

    enum CodingKeys: String, CodingKey {
        case text
        case finishReason = "finish_reason"
        case index
        case logprobs
    }
}
