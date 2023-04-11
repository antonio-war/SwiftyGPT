//
//  SwiftyGPT+Completion.swift
//  
//
//  Created by Antonio Guerra on 11/04/23.
//

import Foundation
import SwiftyHTTP
import SwiftyRanged

// MARK: - Completion
extension SwiftyGPT {
    
    public func completion(prompt: String, model: SwiftyGPTCompletionModel = .stable, suffix: String? = nil, @SwiftyOptionalRanged(0...4096) maxTokens: Int? = nil, @SwiftyOptionalRanged(0...2) temperature: Float? = nil, choices: Int? = nil, @SwiftyOptionalRanged(1...5) logprobs: Int? = nil, echo: Bool? = nil, @SwiftyOptionalRanged(-2...2) presencePenalty: Float? = nil, @SwiftyOptionalRanged(-2...2) frequencyPenalty: Float? = nil, user: String? = nil, completion: @escaping (Result<SwiftyGPTCompletionResponse, Error>) -> ()) {
        
    }
}
