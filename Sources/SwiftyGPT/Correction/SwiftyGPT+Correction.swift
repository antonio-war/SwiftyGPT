//
//  SwiftyGPT+Correction.swift
//  
//
//  Created by Antonio Guerra on 13/04/23.
//

import Foundation

extension SwiftyGPT {
    
    public func correction(text: String, language: SwiftyGPTLanguage? = nil, user: String? = nil, completion: @escaping (Result<String, Error>) -> ()) {
        self.completion(prompt: prompt(text: text, language: language), model: .text_davinci_003, temperature: 0.0, presencePenalty: 0.0, frequencyPenalty: 0.0, user: user) { result in
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
    
    public func correction(text: String, language: SwiftyGPTLanguage? = nil, user: String? = nil) async -> Result<String, Error> {
        return await withCheckedContinuation { continuation in
            correction(text: text, language: language, user: user) { result in
                continuation.resume(returning: result)
            }
        }
    }
    
    private func prompt(text: String, language: SwiftyGPTLanguage? = nil) -> String {
        let text = text.trimmingCharacters(in: .whitespacesAndNewlines)
        guard let language = language?.rawValue.capitalized else {
            return "Correct this text: \n\(text)"
        }
        return "Correct this text to standard \(language): \n\(text)"
    }
}
