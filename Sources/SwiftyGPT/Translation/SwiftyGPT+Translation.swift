//
//  SwiftyGPT+Translation.swift
//  
//
//  Created by Antonio Guerra on 12/04/23.
//

import Foundation

extension SwiftyGPT {
    
    public func translation(text: String, from: SwiftyGPTLanguage, to: SwiftyGPTLanguage, user: String? = nil, completion: @escaping (Result<String, Error>) -> ()) {
        
        let prompt = "Translate this from \(from.rawValue.capitalized) to \(to.rawValue.capitalized): \n\(text.trimmingCharacters(in: .whitespacesAndNewlines))"
        
        self.completion(prompt: prompt, model: .text_davinci_003, temperature: 0.3, presencePenalty: 0.0, frequencyPenalty: 0.0) { result in
            switch result {
                case .success(let response):
                    if let text = response.choices.first?.text {
                        completion(.success(text))
                    } else {
                        completion(.failure(URLError(.badServerResponse)))
                    }
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
}
