//
//  SwiftyGPTChatResponseBody.swift
//  
//
//  Created by Antonio Guerra on 11/04/24.
//

import Foundation

public protocol SwiftyGPTChatResponseBody: Decodable, Equatable {}

public struct SwiftyGPTChatResponseSuccessBody: SwiftyGPTChatResponseBody, Identifiable {
    public let id: String
    public let choices: [SwiftyGPTChatResponseChoice]
    public let created: TimeInterval
    public let model: SwiftyGPTChatModel
    public let fingerprint: String
    public let object: SwiftyGPTChatResponseObject
    public let usage: SwiftyGPTChatResponseTokenUsage
    
    enum CodingKeys: String, CodingKey {
        case id
        case choices
        case created
        case model
        case fingerprint = "system_fingerprint"
        case object
        case usage
    }
}

public struct SwiftyGPTChatResponseFailureBody: SwiftyGPTChatResponseBody, Decodable {
    let error: SwiftyGPTChatResponseError
}
