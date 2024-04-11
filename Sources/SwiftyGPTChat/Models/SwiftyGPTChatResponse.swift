//
//  SwiftyGPTChatResponse.swift
//  
//
//  Created by Antonio Guerra on 11/04/24.
//

import Foundation

struct SwiftyGPTChatResponse: Identifiable {
    let id: String
    // TODO: add choices
    let created: Date
    let model: SwiftyGPTChatModel
    let fingerprint: String
    let object: String = "chat.completion"
    // TODO: add usage
}
