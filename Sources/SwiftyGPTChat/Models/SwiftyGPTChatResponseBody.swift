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
    
    public init(id: String, choices: [SwiftyGPTChatResponseChoice], created: TimeInterval, model: SwiftyGPTChatModel, fingerprint: String, object: SwiftyGPTChatResponseObject, usage: SwiftyGPTChatResponseTokenUsage) {
        self.id = id
        self.choices = choices
        self.created = created
        self.model = model
        self.fingerprint = fingerprint
        self.object = object
        self.usage = usage
    }
    
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
    public let error: SwiftyGPTChatResponseError
    
    public init(error: SwiftyGPTChatResponseError) {
        self.error = error
    }
}
