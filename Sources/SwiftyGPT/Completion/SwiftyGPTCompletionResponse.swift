//
//  SwiftyGPTCompletionResponse.swift
//  
//
//  Created by Antonio Guerra on 11/04/23.
//

import Foundation

struct SwiftyGPTCompletionResponse: SwiftyGPTResponse {
    var id: String
    var object: String
    var created: TimeInterval
    var usage: SwiftyGPTUsage
    var model: SwiftyGPTCompletionModel
    var choices: [SwiftyGPTCompletionChoice]
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
