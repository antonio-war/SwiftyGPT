//
//  SwiftyGPTRouter.swift
//  
//
//  Created by Antonio Guerra on 27/03/23.
//

import Foundation
import SwiftyHTTP

enum SwiftyGPTRouter: SwiftyHTTPRequest {
    
    case chat(String, SwiftyGPTChatRequest)
    case image(String, SwiftyGPTImageRequest)
    case completion(String, SwiftyGPTCompletionRequest)
    
    var baseURL: URL? {
        return URL(string: "https://api.openai.com")
    }
    
    var path: String {
        switch self {
        case .chat:
            return "/v1/chat/completions"
        case .image:
            return "/v1/images/generations"
        case .completion:
            return "/v1/completions"
        }
    }
    
    var method: SwiftyHTTPMethod {
        switch self {
        case .chat:
            return .post
        case .image:
            return .post
        case .completion:
            return .post
        }
    }
    
    var headers: [SwiftyHTTPHeader] {
        switch self {
        case .chat(let apiKey, _), .image(let apiKey, _), .completion(let apiKey, _):
            return [
                SwiftyHTTPHeader.contentType(.application(.json)),
                SwiftyHTTPHeader.authorization(.bearer(apiKey))
            ]
        }
    }
    
    var parameters: [SwiftyHTTPQueryParameter] {
        []
    }
    
    var body: SwiftyHTTPRequestBody? {
        switch self {
            case .chat(_, let request):
                return request
            case .image(_, let request):
                return request
            case .completion(_, let request):
                return request
        }
    }
}
