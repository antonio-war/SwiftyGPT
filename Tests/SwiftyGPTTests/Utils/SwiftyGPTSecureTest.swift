//
//  SwiftyGPTSecureTest.swift
//  
//
//  Created by Antonio Guerra on 30/03/23.
//

import Foundation

protocol SwiftyGPTSecureTest {
    var apiKey: String { get }
}

extension SwiftyGPTSecureTest {
    var apiKey: String {
        get {
            guard let filePath = Bundle.module.path(forResource: "OpenAI-Info", ofType: "plist"), let plist = NSDictionary(contentsOfFile: filePath), let apiKey = plist.value(forKey: "API_KEY") as? String else {
                return ""
            }
            return apiKey
        }
    }
}
