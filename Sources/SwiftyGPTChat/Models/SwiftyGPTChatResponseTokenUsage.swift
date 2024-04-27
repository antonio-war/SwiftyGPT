//
//  SwiftyGPTChatResponseUsage.swift
//
//
//  Created by Antonio Guerra on 27/04/24.
//

import Foundation

public struct SwiftyGPTChatResponseTokenUsage: Decodable, Equatable {
    let completion: Int
    let prompt: Int
    let total: Int
    
    enum CodingKeys: String, CodingKey {
        case completion = "completion_tokens"
        case prompt = "prompt_tokens"
        case total = "total_tokens"
    }
}
