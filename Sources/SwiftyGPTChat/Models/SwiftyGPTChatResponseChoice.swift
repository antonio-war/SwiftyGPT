//
//  SwiftyGPTChatResponseChoice.swift
//
//
//  Created by Antonio Guerra on 27/04/24.
//

import Foundation

public struct SwiftyGPTChatResponseChoice: Decodable, Equatable {
    public let index: Int
    let codableMessage: SwiftyGPTChatCodableMessage
    public let finishReason: SwiftyGPTChatResponseFinishReason
    
    public var message: any SwiftyGPTChatMessage {
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
    
    public init(index: Int, message: any SwiftyGPTChatMessage, finishReason: SwiftyGPTChatResponseFinishReason) {
        self.index = index
        switch message {
        case let message as SwiftyGPTChatUserMessage:
            self.codableMessage = .user(message)
        case let message as SwiftyGPTChatAssistantMessage:
            self.codableMessage = .assistant(message)
        case let message as SwiftyGPTChatToolMessage:
            self.codableMessage = .tool(message)
        default:
            let message = message as! SwiftyGPTChatSystemMessage
            self.codableMessage = .system(message)
        }
        self.finishReason = finishReason
    }
    
    init(index: Int, codableMessage: SwiftyGPTChatCodableMessage, finishReason: SwiftyGPTChatResponseFinishReason) {
        self.index = index
        self.codableMessage = codableMessage
        self.finishReason = finishReason
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
