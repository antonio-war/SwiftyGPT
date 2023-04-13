//
//  SwiftyGPTTokenizer.swift
//  
//
//  Created by Antonio Guerra on 13/04/23.
//

import Foundation
import NaturalLanguage

public struct SwiftyGPTTokenizer {
    private let wrapped: NLTokenizer
    
    init() {
        wrapped = NLTokenizer(unit: .word)
    }
    
    func tokenize(_ text: String, language: SwiftyGPTLanguage? = nil) -> Int {
        wrapped.string = text
        
        if let language = language?.naturalLanguage {
            wrapped.setLanguage(language)
        }
        
        return Int(Float(wrapped.tokens(for: text.startIndex..<text.endIndex).count) * 2.3)
    }
}
