//
//  SwiftyGPTChatResponseUsage.swift
//
//
//  Created by Antonio Guerra on 27/04/24.
//

import Foundation

public struct SwiftyGPTChatResponseTokenUsage: Decodable, Equatable {
    public let completion: Int
    public let prompt: Int
    public let total: Int
    
    public init(completion: Int, prompt: Int, total: Int) {
        self.completion = completion
        self.prompt = prompt
        self.total = total
    }
    
    enum CodingKeys: String, CodingKey {
        case completion = "completion_tokens"
        case prompt = "prompt_tokens"
        case total = "total_tokens"
    }
}
