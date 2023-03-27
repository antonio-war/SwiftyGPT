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
    
    init(apiKey: String) {
        self.apiKey = apiKey
    }
    
    func chat(messages: [SwiftyGPTMessage], model: SwiftyGPTModel = .stable, completion: @escaping (Result<SwiftyGPTResponse, Error>) -> ()) {
        let request = SwiftyGPTRequest(model: model, messages: messages)
        SwiftyHTTP.request(with: SwiftyGPTRouter.chat(apiKey, request), body: SwiftyGPTResponse.self) { result in
            switch result {
            case .success(let response):
                completion(.success(response.body))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func chat(messages: [SwiftyGPTMessage], model: SwiftyGPTModel = .stable) async -> Result<SwiftyGPTResponse, Error> {
        return await withCheckedContinuation { continuation in
            chat(messages: messages, model: model) { result in
                continuation.resume(returning: result)
            }
        }
    }
}
