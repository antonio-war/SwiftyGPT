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
}
