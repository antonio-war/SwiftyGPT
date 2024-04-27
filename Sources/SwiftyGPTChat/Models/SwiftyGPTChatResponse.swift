//
//  SwiftyGPTChatResponse.swift
//  
//
//  Created by Antonio Guerra on 14/04/24.
//

import Foundation

enum SwiftyGPTChatResponse: Equatable {
    case success(body: SwiftyGPTChatResponseSuccessBody)
    case failure(body: SwiftyGPTChatResponseFailureBody)
    
    init(body: any SwiftyGPTChatResponseBody) throws {
        switch body {
        case let body as SwiftyGPTChatResponseSuccessBody:
            self = .success(body: body)
        case let body as SwiftyGPTChatResponseFailureBody:
            self = .failure(body: body)
        default:
            throw URLError(.cannotParseResponse)
        }
    }
}
