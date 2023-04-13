//
//  SwiftyGPT+Correction.swift
//  
//
//  Created by Antonio Guerra on 13/04/23.
//

import Foundation

extension SwiftyGPT {
    
    private func prompt(text: String, language: SwiftyGPTLanguage? = nil) -> String {
        let text = text.trimmingCharacters(in: .whitespacesAndNewlines)
        guard let language = language?.rawValue.capitalized else {
            return "Correct this text: \n\(text)"
        }
        return "Correct this text to standard \(language): \n\(text)"
    }
}
