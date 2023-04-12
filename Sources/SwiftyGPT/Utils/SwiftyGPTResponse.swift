//
//  SwiftyGPTResponse.swift
//  
//
//  Created by Antonio Guerra on 11/04/23.
//

import Foundation
import SwiftyHTTP

protocol SwiftyGPTResponse: SwiftyHTTPResponseBody {
    associatedtype GPTModel: SwiftyGPTModel
    associatedtype GPTChoice: SwiftyGPTChoice
    
    var id: String { get }
    var object: String { get }
    var created: TimeInterval { get }
    var model: GPTModel { get }
    var usage: SwiftyGPTUsage { get }
    var choices: [GPTChoice] { get }
}

// MARK: - Choice
protocol SwiftyGPTChoice: Codable {
    var finishReason: SwiftyGPTFinishReason { get }
    var index: Int { get }
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
