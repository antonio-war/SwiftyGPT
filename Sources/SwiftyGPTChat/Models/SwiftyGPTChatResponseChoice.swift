//
//  SwiftyGPTChatResponseChoice.swift
//
//
//  Created by Antonio Guerra on 27/04/24.
//

import Foundation

public struct SwiftyGPTChatResponseChoice: Decodable, Equatable {
    let index: Int
    let codableMessage: SwiftyGPTChatCodableMessage
    let finishReason: SwiftyGPTChatResponseFinishReason
    
    var message: any SwiftyGPTChatMessage {
        switch codableMessage {
        case .system(let message):
            return message
        case .user(let message):
            return message
        case .assistant(let message):
            return message
        case .tool(let message):
            return message
        }
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.index = try container.decode(Int.self, forKey: .index)
        self.codableMessage = try container.decode(SwiftyGPTChatCodableMessage.self, forKey: .message)
        self.finishReason = try container.decode(SwiftyGPTChatResponseFinishReason.self, forKey: .finishReason)
    }
    
    enum CodingKeys: String, CodingKey {
        case index
        case message
        case finishReason = "finish_reason"
    }
}
