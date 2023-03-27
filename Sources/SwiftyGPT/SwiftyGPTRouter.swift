//
//  SwiftyGPTRouter.swift
//  
//
//  Created by Antonio Guerra on 27/03/23.
//

import Foundation
import SwiftyHTTP

enum SwiftyGPTRouter: SwiftyHTTPRouter {
    
    case chat(String, SwiftyGPTRequest)
    
    var baseURL: URL? {
        return URL(string: "https://api.openai.com")
    }
    
    var path: String {
        switch self {
        case .chat:
            return "/v1/chat/completions"
        }
    }
    
    var method: SwiftyHTTPMethod {
        switch self {
        case .chat:
            return .post
        }
    }
    
    var headers: [SwiftyHTTPHeader] {
        switch self {
        case .chat(let apiKey, _):
            return [
                SwiftyHTTPHeader.contentType(.application(.json)),
                SwiftyHTTPHeader.authorization(.bearer(apiKey))
            ]
        }
    }
    
    var parameters: [SwiftyHTTPQueryParameter] {
        []
    }
    
    var body: SwiftyHTTPBody? {
        switch self {
            case .chat(_, let request):
                return request
        }
    }
}
