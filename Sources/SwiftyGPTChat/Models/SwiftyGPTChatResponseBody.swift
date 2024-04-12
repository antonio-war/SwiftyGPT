//
//  SwiftyGPTChatResponseBody.swift
//  
//
//  Created by Antonio Guerra on 11/04/24.
//

import Foundation

struct SwiftyGPTChatResponseBody: Identifiable {
    let id: String
    // TODO: add choices
    let created: Date
    let model: SwiftyGPTChatModel
    let fingerprint: String
    let object: String = "chat.completion"
    // TODO: add usage
    
    enum CodingKeys: String, CodingKey {
        case id
        case created
        case model
        case fingerprint = "system_fingerprint"
    }
}