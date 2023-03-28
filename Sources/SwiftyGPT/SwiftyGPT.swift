//
//  SwiftyGPTMessage.swift
//
//
//  Created by Antonio Guerra on 27/03/23.
//

import Foundation
import SwiftyHTTP

public class SwiftyGPT: ObservableObject {
    
    let apiKey: String
    @Published var conversation: [SwiftyGPTMessage]
    
    public init(apiKey: String) {
        self.apiKey = apiKey
        self.conversation = []
    }
        
    // MARK: - Chat
    
    public func chat(messages: [SwiftyGPTMessage], model: SwiftyGPTModel = .stable, @Ranged(0...2) temperature: Float = 1, choices: Int = 1, @Ranged(-2.0...2.0) presencePenalty: Float = 0, @Ranged(-2.0...2.0) frequencyPenalty: Float = 0, user: String? = nil, completion: @escaping (Result<SwiftyGPTResponse, Error>) -> ()) {
        let request = SwiftyGPTRequest(messages: messages, model: model, temperature: temperature, choices: choices, stream: false, presencePenalty: presencePenalty, frequencyPenalty: frequencyPenalty, user: user)
        SwiftyHTTP.request(with: SwiftyGPTRouter.chat(apiKey, request), body: SwiftyGPTResponse.self) { result in
            switch result {
            case .success(let response):
                self.conversation.append(contentsOf: request.messages)
                self.conversation.append(contentsOf: response.body.choices.compactMap({ $0.message }))
                completion(.success(response.body))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public func chat(messages: [SwiftyGPTMessage], model: SwiftyGPTModel = .stable, @Ranged(0...2) temperature: Float = 1, choices: Int = 1, @Ranged(-2.0...2.0) presencePenalty: Float = 0, @Ranged(-2.0...2.0) frequencyPenalty: Float = 0, user: String? = nil) async -> Result<SwiftyGPTResponse, Error> {
        return await withCheckedContinuation { continuation in
            chat(messages: messages, model: model, temperature: temperature, choices: choices, presencePenalty: presencePenalty, frequencyPenalty: frequencyPenalty, user: user) { result in
                continuation.resume(returning: result)
            }
        }
    }
    
    public func chat(message: SwiftyGPTMessage, model: SwiftyGPTModel = .stable, @Ranged(0...2) temperature: Float = 1, choices: Int = 1, @Ranged(-2.0...2.0) presencePenalty: Float = 0, @Ranged(-2.0...2.0) frequencyPenalty: Float = 0, user: String? = nil, completion: @escaping (Result<SwiftyGPTResponse, Error>) -> ()) {
        chat(messages: [message], model: model, temperature: temperature, choices: choices, presencePenalty: presencePenalty, frequencyPenalty: frequencyPenalty, user: user, completion: completion)
    }
    
    public func chat(message: SwiftyGPTMessage, model: SwiftyGPTModel = .stable, @Ranged(0...2) temperature: Float = 1, choices: Int = 1, @Ranged(-2.0...2.0) presencePenalty: Float = 0, @Ranged(-2.0...2.0) frequencyPenalty: Float = 0, user: String? = nil) async -> Result<SwiftyGPTResponse, Error> {
        await chat(messages: [message], model: model, temperature: temperature, choices: choices, presencePenalty: presencePenalty, frequencyPenalty: frequencyPenalty, user: user)
    }
    
    public func chat(messages: [String], model: SwiftyGPTModel = .stable, @Ranged(0...2) temperature: Float = 1, @Ranged(-2.0...2.0) presencePenalty: Float = 0, @Ranged(-2.0...2.0) frequencyPenalty: Float = 0, user: String? = nil, completion: @escaping (Result<String, Error>) -> ()) {
        chat(messages: messages.map({SwiftyGPTMessage(content: $0)}), model: model, temperature: temperature, presencePenalty: presencePenalty, frequencyPenalty: frequencyPenalty, user: user) { result in
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
    
    public func chat(messages: [String], model: SwiftyGPTModel = .stable, @Ranged(0...2) temperature: Float = 1, @Ranged(-2.0...2.0) presencePenalty: Float = 0, @Ranged(-2.0...2.0) frequencyPenalty: Float = 0, user: String? = nil) async -> Result<String, Error> {
        return await withCheckedContinuation { continuation in
            chat(messages: messages, model: model, temperature: temperature, presencePenalty: presencePenalty, frequencyPenalty: frequencyPenalty, user: user) { result in
                continuation.resume(returning: result)
            }
        }
    }
    
    public func chat(message: String, model: SwiftyGPTModel = .stable, @Ranged(0...2) temperature: Float = 1, @Ranged(-2.0...2.0) presencePenalty: Float = 0, @Ranged(-2.0...2.0) frequencyPenalty: Float = 0, user: String? = nil, completion: @escaping (Result<String, Error>) -> ()) {
        chat(messages: [message], model: model, temperature: temperature, presencePenalty: presencePenalty, frequencyPenalty: frequencyPenalty, user: user, completion: completion)
    }
    
    public func chat(message: String, model: SwiftyGPTModel = .stable, @Ranged(0...2) temperature: Float = 1, @Ranged(-2.0...2.0) presencePenalty: Float = 0, @Ranged(-2.0...2.0) frequencyPenalty: Float = 0, user: String? = nil) async -> Result<String, Error> {
        await chat(messages: [message], model: model, temperature: temperature, presencePenalty: presencePenalty, frequencyPenalty: frequencyPenalty, user: user)
    }
}
