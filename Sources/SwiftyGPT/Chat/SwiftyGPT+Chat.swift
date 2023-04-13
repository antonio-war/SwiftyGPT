//
//  SwiftyGPT+Chat.swift
//  
//
//  Created by Antonio Guerra on 30/03/23.
//

import Foundation
import SwiftyHTTP
import SwiftyRanged

// MARK: - Chat
extension SwiftyGPT {
    
    public func chat(messages: [SwiftyGPTChatMessage], model: SwiftyGPTChatModel = .stable, @SwiftyOptionalRanged(0...2) temperature: Float? = nil, choices: Int? = nil, maxTokens: Int? = nil, @SwiftyOptionalRanged(-2...2) presencePenalty: Float? = nil, @SwiftyOptionalRanged(-2...2) frequencyPenalty: Float? = nil, user: String? = nil, completion: @escaping (Result<SwiftyGPTChatResponse, Error>) -> ()) {
        
        let request = SwiftyGPTChatRequest(messages: messages, model: model, temperature: temperature, choices: choices, stream: false, maxTokens: maxTokens, presencePenalty: presencePenalty, frequencyPenalty: frequencyPenalty, user: user)
        SwiftyHTTP.request(SwiftyGPTRouter.chat(apiKey, request)) { result in
            switch result {
            case .success(let response):
                if response.statusCode == 200 {
                    guard let body = try? JSONDecoder().decode(SwiftyGPTChatResponse.self, from: response.body) else {
                        completion(.failure(URLError(.badServerResponse)))
                        return
                    }
                    completion(.success(body))
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
    
    public func chat(messages: [SwiftyGPTChatMessage], model: SwiftyGPTChatModel = .stable, @SwiftyOptionalRanged(0...2) temperature: Float? = nil, choices: Int? = nil, maxTokens: Int? = nil, @SwiftyOptionalRanged(-2...2) presencePenalty: Float? = nil, @SwiftyOptionalRanged(-2...2) frequencyPenalty: Float? = nil, user: String? = nil) async -> Result<SwiftyGPTChatResponse, Error> {
        
        return await withCheckedContinuation { continuation in
            chat(messages: messages, model: model, temperature: temperature, choices: choices, maxTokens: maxTokens, presencePenalty: presencePenalty, frequencyPenalty: frequencyPenalty, user: user) { result in
                continuation.resume(returning: result)
            }
        }
    }
    
    public func chat(message: SwiftyGPTChatMessage, model: SwiftyGPTChatModel = .stable, @SwiftyOptionalRanged(0...2) temperature: Float? = nil, choices: Int? = nil, maxTokens: Int? = nil, @SwiftyOptionalRanged(-2...2) presencePenalty: Float? = nil, @SwiftyOptionalRanged(-2...2) frequencyPenalty: Float? = nil, user: String? = nil, completion: @escaping (Result<SwiftyGPTChatResponse, Error>) -> ()) {
        chat(messages: [message], model: model, temperature: temperature, choices: choices, maxTokens: maxTokens, presencePenalty: presencePenalty, frequencyPenalty: frequencyPenalty, user: user, completion: completion)
    }

    public func chat(message: SwiftyGPTChatMessage, model: SwiftyGPTChatModel = .stable, @SwiftyOptionalRanged(0...2) temperature: Float? = nil, choices: Int? = nil, maxTokens: Int? = nil, @SwiftyOptionalRanged(-2...2) presencePenalty: Float? = nil, @SwiftyOptionalRanged(-2...2) frequencyPenalty: Float? = nil, user: String? = nil) async -> Result<SwiftyGPTChatResponse, Error> {
        
        await chat(messages: [message], model: model, temperature: temperature, choices: choices, maxTokens: maxTokens, presencePenalty: presencePenalty, frequencyPenalty: frequencyPenalty, user: user)
    }

    public func chat(messages: [String], model: SwiftyGPTChatModel = .stable, user: String? = nil, completion: @escaping (Result<String, Error>) -> ()) {
        chat(messages: messages.map({SwiftyGPTChatMessage(content: $0)}), model: model, user: user) { result in
            switch result {
            case .success(let response):
                guard let message = response.choices.first?.message else {
                    completion(.failure(URLError(.badServerResponse)))
                    return
                }
                completion(.success(message.content))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    public func chat(messages: [String], model: SwiftyGPTChatModel = .stable, user: String? = nil) async -> Result<String, Error> {
        return await withCheckedContinuation { continuation in
            chat(messages: messages, model: model, user: user) { result in
                continuation.resume(returning: result)
            }
        }
    }

    public func chat(message: String, model: SwiftyGPTChatModel = .stable, user: String? = nil, completion: @escaping (Result<String, Error>) -> ()) {
        chat(messages: [message], model: model, user: user, completion: completion)
    }

    public func chat(message: String, model: SwiftyGPTChatModel = .stable, user: String? = nil) async -> Result<String, Error> {
        await chat(messages: [message], model: model, user: user)
    }
}
