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
        
    public func chat(messages: [SwiftyGPTMessage], model: SwiftyGPTModel = .stable, @Ranged(0...2) temperature: Float = 1, choices: Int = 1, tokens: Int = Int.max, @Ranged(-2.0...2.0) presencePenalty: Float = 0, @Ranged(-2.0...2.0) frequencyPenalty: Float = 0, user: String? = nil, completion: @escaping (Result<SwiftyGPTResponse, Error>) -> ()) {
        let request = SwiftyGPTRequest(messages: messages, model: model, temperature: temperature, choices: choices, stream: false, tokens: tokens, presencePenalty: presencePenalty, frequencyPenalty: frequencyPenalty, user: user)
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
    
    public func chat(messages: [SwiftyGPTMessage], model: SwiftyGPTModel = .stable, @Ranged(0...2) temperature: Float = 1, choices: Int = 1, tokens: Int = Int.max, @Ranged(-2.0...2.0) presencePenalty: Float = 0, @Ranged(-2.0...2.0) frequencyPenalty: Float = 0, user: String? = nil) async -> Result<SwiftyGPTResponse, Error> {
        return await withCheckedContinuation { continuation in
            chat(messages: messages, model: model, temperature: temperature, choices: choices, tokens: tokens, presencePenalty: presencePenalty, frequencyPenalty: frequencyPenalty, user: user) { result in
                continuation.resume(returning: result)
            }
        }
    }
}
