//
//  SwiftyGPTChatResponse.swift
//  
//
//  Created by Antonio Guerra on 14/04/24.
//

import Foundation

enum SwiftyGPTChatResponse {
    case success(body: SwiftyGPTChatResponseSuccessBody)
    case failure(body: SwiftyGPTChatResponseFailureBody)
}
