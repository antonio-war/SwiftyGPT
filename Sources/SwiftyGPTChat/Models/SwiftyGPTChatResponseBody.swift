//
//  SwiftyGPTChatResponseBody.swift
//  
//
//  Created by Antonio Guerra on 11/04/24.
//

import Foundation

protocol SwiftyGPTChatResponseBody: Decodable {}

struct SwiftyGPTChatResponseSuccessBody: SwiftyGPTChatResponseBody, Identifiable {
    let id: String
    // TODO: add choices
    let created: TimeInterval
    let model: SwiftyGPTChatModel
    let fingerprint: String
    // TODO: object can be an enum ?
    let object: String
    // TODO: add usage
    
    enum CodingKeys: String, CodingKey {
        case id
        case created
        case model
        case fingerprint = "system_fingerprint"
        case object
    }
}

struct SwiftyGPTChatResponseFailureBody: SwiftyGPTChatResponseBody, Decodable {
}
