//
//  SwiftyGPT+SentimentAnalysis.swift
//  
//
//  Created by Antonio Guerra on 13/04/23.
//

import Foundation

extension SwiftyGPT {
    
    public func sentimentAnalysis(text: String, language: SwiftyGPTLanguage? = nil, user: String? = nil, completion: @escaping (Result<SwiftyGPTSentiment, Error>) -> ()) {
        self.completion(prompt: prompt(text: text, language: language), model: .text_davinci_003, temperature: 0.0, presencePenalty: 0.0, frequencyPenalty: 0.5, user: user) { result in
            switch result {
                case .success(let response):
                    if let text = response.choices.first?.text {
                        completion(.success(SwiftyGPTSentiment(rawValue: text.lowercased()) ?? .neutral))
                    } else {
                        completion(.failure(URLError(.badServerResponse)))
                    }
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
    
    public func sentimentAnalysis(text: String, language: SwiftyGPTLanguage? = nil, user: String? = nil) async -> Result<SwiftyGPTSentiment, Error> {
        return await withCheckedContinuation { continuation in
            sentimentAnalysis(text: text, language: language, user: user) { result in
                continuation.resume(returning: result)
            }
        }
    }
    
    private func prompt(text: String, language: SwiftyGPTLanguage? = nil) -> String {
        let text = text.trimmingCharacters(in: .whitespacesAndNewlines)
        guard let language = language?.rawValue.capitalized else {
            return "Decide whether this text sentiment is positive, neutral, or negative: \n\(text)"
        }
        return "Decide whether this \(language) text sentiment is positive, neutral, or negative: \n\(text)"
    }
}
