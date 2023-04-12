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
    
    public func completion(prompt: String, model: SwiftyGPTCompletionModel = .stable, suffix: String? = nil, @SwiftyOptionalRanged(0...4096) maxTokens: Int? = 2048, @SwiftyOptionalRanged(0...2) temperature: Float? = nil, choices: Int? = nil, @SwiftyOptionalRanged(1...5) logprobs: Int? = nil, echo: Bool? = nil, @SwiftyOptionalRanged(-2...2) presencePenalty: Float? = nil, @SwiftyOptionalRanged(-2...2) frequencyPenalty: Float? = nil, user: String? = nil, completion: @escaping (Result<SwiftyGPTCompletionResponse, Error>) -> ()) {
        
        let request = SwiftyGPTCompletionRequest(prompt: prompt, model: model, suffix: suffix, maxTokens: maxTokens, temperature: temperature, choices: choices, stream: false, logprobs: logprobs, echo: echo, presencePenalty: presencePenalty, frequencyPenalty: frequencyPenalty, user: user)
        SwiftyHTTP.request(SwiftyGPTRouter.completion(apiKey, request)) { result in
            switch result {
            case .success(let response):
                if response.statusCode == 200 {
                    guard let body = try? JSONDecoder().decode(SwiftyGPTCompletionResponse.self, from: response.body) else {
                        completion(.failure(URLError(.badServerResponse)))
                        return
                    }
                    
                    let formattedBody = SwiftyGPTCompletionResponse(id: body.id, object: body.object, created: body.created, usage: body.usage, model: body.model, choices: body.choices.map { SwiftyGPTCompletionChoice(finishReason: $0.finishReason, index: $0.index, text: $0.text.trimmingCharacters(in: .whitespacesAndNewlines), logprobs: $0.logprobs)})
                    
                    completion(.success(formattedBody))
                } else {
                    guard let error = try? JSONDecoder().decode(SwiftyGPTError.self, from: response.body) else {
                        completion(.failure(URLError(.badServerResponse)))
                        return
                    }
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public func completion(prompt: String, model: SwiftyGPTCompletionModel = .stable, suffix: String? = nil, @SwiftyOptionalRanged(0...4096) maxTokens: Int? = 2048, @SwiftyOptionalRanged(0...2) temperature: Float? = nil, choices: Int? = nil, @SwiftyOptionalRanged(1...5) logprobs: Int? = nil, echo: Bool? = nil, @SwiftyOptionalRanged(-2...2) presencePenalty: Float? = nil, @SwiftyOptionalRanged(-2...2) frequencyPenalty: Float? = nil, user: String? = nil) async -> Result<SwiftyGPTCompletionResponse, Error> {
        
        return await withCheckedContinuation { continuation in
            completion(prompt: prompt, model: model, suffix: suffix, maxTokens: maxTokens, temperature: temperature, choices: choices, logprobs: logprobs, echo: echo, presencePenalty: presencePenalty, frequencyPenalty: frequencyPenalty, user: user) { result in
                continuation.resume(returning: result)
            }
        }
    }
}
