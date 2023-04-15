//
//  SwiftyGPT+Summary.swift
//  
//
//  Created by Antonio Guerra on 12/04/23.
//

import Foundation

extension SwiftyGPT {
    
    public func summary(text: String, language: SwiftyGPTLanguage? = nil, user: String? = nil, completion: @escaping (Result<String, Error>) -> ()) {
        self.completion(prompt: prompt(text: text, language: language), model: .text_davinci_003, temperature: 0.3, presencePenalty: 0.0, frequencyPenalty: 0.0, user: user) { result in
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
    
    public func summary(text: String, language: SwiftyGPTLanguage? = nil, user: String? = nil) async -> Result<String, Error> {
        return await withCheckedContinuation { continuation in
            summary(text: text, language: language, user: user) { result in
                continuation.resume(returning: result)
            }
        }
    }
    
    private func prompt(text: String, language: SwiftyGPTLanguage? = nil) -> String {
        let text = text.trimmingCharacters(in: .whitespacesAndNewlines)
        guard let language = language?.rawValue.capitalized else {
            return "Summarize this text for a second-grade student: \n\(text)"
        }
        return "Summarize this \(language) text for a second-grade student: \n\(text)"
    }
}
