//
//  SwiftyGPTChatRequest.swift
//  
//
//  Created by Antonio Guerra on 14/04/24.
//

import Foundation
import SwiftyGPTNetworking

struct SwiftyGPTChatRequest: SwiftyGPTNetworkingRequest {
    private let apiKey: String
    private let organization: String?
    internal let body: Data?
    
    init(apiKey: String, organization: String? = nil, body: Data) {
        self.apiKey = apiKey
        self.organization = organization
        self.body = body
    }
    
    var endpoint: URL? {
        return URL(string: "https://api.openai.com/")
    }
    
    var path: String {
        return "v1/chat/completions"
    }
    
    var method: SwiftyGPTNetworkingMethod {
        return .post
    }
    
    public var headers: [String : String] {
        guard let organization else {
            return [
                "Content-Type": "application/json",
                "Authorization": "Bearer \(apiKey)"
            ]
        }
        return [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(apiKey)",
            "OpenAI-Organization": organization
        ]
    }
    
    public var cachePolicy: URLRequest.CachePolicy {
        return .reloadIgnoringLocalCacheData
    }
    
    public var timeout: TimeInterval {
        return 60.0
    }
}
