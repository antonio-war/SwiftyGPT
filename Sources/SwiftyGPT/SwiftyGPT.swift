//
//  SwiftyGPTMessage.swift
//
//
//  Created by Antonio Guerra on 27/03/23.
//

import Foundation
import SwiftyHTTP
import SwiftyRanged

public class SwiftyGPT: ObservableObject {
    
    let apiKey: String
    @Published var conversation: [SwiftyGPTMessage]
    
    public init(apiKey: String) {
        self.apiKey = apiKey
        self.conversation = []
    }
        
    // MARK: - Chat
    
    public func chat(messages: [SwiftyGPTMessage], model: SwiftyGPTModel = .stable, @SwiftyOptionalRanged(0...2) temperature: Float? = nil, choices: Int? = nil, @SwiftyOptionalRanged(0...4096) maxTokens: Int? = nil, @SwiftyOptionalRanged(-2...2) presencePenalty: Float? = nil, @SwiftyOptionalRanged(-2...2) frequencyPenalty: Float? = nil, user: String? = nil, completion: @escaping (Result<SwiftyGPTResponse, Error>) -> ()) {
        
        let request = SwiftyGPTRequest(messages: messages, model: model, temperature: temperature, choices: choices, stream: false, maxTokens: maxTokens, presencePenalty: presencePenalty, frequencyPenalty: frequencyPenalty, user: user)
        SwiftyHTTP.request(with: SwiftyGPTRouter.chat(apiKey, request)) { result in
            switch result {
            case .success(let response):
                if response.statusCode == 200 {
                    guard let body = try? JSONDecoder().decode(SwiftyGPTResponse.self, from: response.body) else {
                        completion(.failure(URLError(.badServerResponse)))
                        return
                    }
                    self.conversation.append(contentsOf: request.messages)
                    self.conversation.append(contentsOf: body.choices.compactMap({ $0.message }))
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
    
    public func chat(messages: [SwiftyGPTMessage], model: SwiftyGPTModel = .stable, @SwiftyOptionalRanged(0...2) temperature: Float? = nil, choices: Int? = nil, @SwiftyOptionalRanged(0...4096) maxTokens: Int? = nil, @SwiftyOptionalRanged(-2...2) presencePenalty: Float? = nil, @SwiftyOptionalRanged(-2...2) frequencyPenalty: Float? = nil, user: String? = nil) async -> Result<SwiftyGPTResponse, Error> {
        
        return await withCheckedContinuation { continuation in
            chat(messages: messages, model: model, temperature: temperature, choices: choices, maxTokens: maxTokens, presencePenalty: presencePenalty, frequencyPenalty: frequencyPenalty, user: user) { result in
                continuation.resume(returning: result)
            }
        }
        
    }
    
    public func chat(message: SwiftyGPTMessage, model: SwiftyGPTModel = .stable, @SwiftyOptionalRanged(0...2) temperature: Float? = nil, choices: Int? = nil, @SwiftyOptionalRanged(0...4096) maxTokens: Int? = nil, @SwiftyOptionalRanged(-2...2) presencePenalty: Float? = nil, @SwiftyOptionalRanged(-2...2) frequencyPenalty: Float? = nil, user: String? = nil, completion: @escaping (Result<SwiftyGPTResponse, Error>) -> ()) {
        chat(messages: [message], model: model, temperature: temperature, choices: choices, maxTokens: maxTokens, presencePenalty: presencePenalty, frequencyPenalty: frequencyPenalty, user: user, completion: completion)
    }

    public func chat(message: SwiftyGPTMessage, model: SwiftyGPTModel = .stable, @SwiftyOptionalRanged(0...2) temperature: Float? = nil, choices: Int? = nil, @SwiftyOptionalRanged(0...4096) maxTokens: Int? = nil, @SwiftyOptionalRanged(-2...2) presencePenalty: Float? = nil, @SwiftyOptionalRanged(-2...2) frequencyPenalty: Float? = nil, user: String? = nil) async -> Result<SwiftyGPTResponse, Error> {
        
        await chat(messages: [message], model: model, temperature: temperature, choices: choices, maxTokens: maxTokens, presencePenalty: presencePenalty, frequencyPenalty: frequencyPenalty, user: user)
    }

    public func chat(messages: [String], model: SwiftyGPTModel = .stable, user: String? = nil, completion: @escaping (Result<String, Error>) -> ()) {
        chat(messages: messages.map({SwiftyGPTMessage(content: $0)}), model: model, user: user) { result in
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

    public func chat(messages: [String], model: SwiftyGPTModel = .stable, user: String? = nil) async -> Result<String, Error> {
        return await withCheckedContinuation { continuation in
            chat(messages: messages, model: model, user: user) { result in
                continuation.resume(returning: result)
            }
        }
    }

    public func chat(message: String, model: SwiftyGPTModel = .stable, user: String? = nil, completion: @escaping (Result<String, Error>) -> ()) {
        chat(messages: [message], model: model, user: user, completion: completion)
    }

    public func chat(message: String, model: SwiftyGPTModel = .stable, user: String? = nil) async -> Result<String, Error> {
        await chat(messages: [message], model: model, user: user)
    }
}
