//
//  SwiftyGPTMessage.swift
//
//
//  Created by Antonio Guerra on 27/03/23.
//

import Foundation
import SwiftyHTTP

public struct SwiftyGPT {
    let apiKey: String
    
    public init(apiKey: String) {
        self.apiKey = apiKey
    }
    
    public func chat(messages: [SwiftyGPTMessage], model: SwiftyGPTModel = .stable, temperature: Int = 1, choices: Int = 1, user: String? = nil, completion: @escaping (Result<SwiftyGPTResponse, Error>) -> ()) {
        let request = SwiftyGPTRequest(messages: messages, model: model, temperature: temperature, choices: choices, stream: false, user: user)
        SwiftyHTTP.request(with: SwiftyGPTRouter.chat(apiKey, request), body: SwiftyGPTResponse.self) { result in
            switch result {
            case .success(let response):
                completion(.success(response.body))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public func chat(messages: [SwiftyGPTMessage], model: SwiftyGPTModel = .stable, temperature: Int = 1, choices: Int = 1, user: String? = nil) async -> Result<SwiftyGPTResponse, Error> {
        return await withCheckedContinuation { continuation in
            chat(messages: messages, model: model, temperature: temperature, choices: choices, user: user) { result in
                continuation.resume(returning: result)
            }
        }
    }
    
//    public func chat(messages: [String], role: SwiftyGPTRole = .user, model: SwiftyGPTModel = .stable, completion: @escaping (Result<String, Error>) -> ()) {
//        chat(messages: messages.map { SwiftyGPTMessage(role: role, content: $0)}) { result in
//            switch result {
//            case .success(let response):
//                guard let message = response.choices.first?.message.content else {
//                    completion(.failure(URLError(.badServerResponse)))
//                    return
//                }
//                completion(.success(message))
//            case .failure(let error):
//                completion(.failure(error))
//            }
//        }
//    }
//    
//    public func chat(messages: [String], role: SwiftyGPTRole = .user, model: SwiftyGPTModel = .stable) async -> Result<String, Error> {
//        return await withCheckedContinuation { continuation in
//            chat(messages: messages, model: model) { result in
//                continuation.resume(returning: result)
//            }
//        }
//    }
}
