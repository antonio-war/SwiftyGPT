//
//  SwiftyGPTSecureTest.swift
//  
//
//  Created by Antonio Guerra on 30/03/23.
//

import Foundation

protocol SwiftyGPTSecureTest {
    var apiKey: String { get throws }
}

extension SwiftyGPTSecureTest {
    var apiKey: String {
        get throws {
            guard let filePath = Bundle.main.path(forResource: "OpenAI-Info", ofType: "plist") else {
                throw URLError(.badURL)
            }
            
            return ""
        }
    }
}
