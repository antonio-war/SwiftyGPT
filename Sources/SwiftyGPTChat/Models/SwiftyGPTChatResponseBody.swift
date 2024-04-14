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
    // TODO: add choices
    public let created: TimeInterval
    public let model: SwiftyGPTChatModel
    public let fingerprint: String
    // TODO: object can be an enum ?
    public let object: String
    // TODO: add usage
    
    enum CodingKeys: String, CodingKey {
        case id
        case created
        case model
        case fingerprint = "system_fingerprint"
        case object
    }
}

public struct SwiftyGPTChatResponseFailureBody: SwiftyGPTChatResponseBody, Decodable {
}
