//
//  SwiftyGPTChatMessage.swift
//
//
//  Created by Antonio Guerra on 11/04/24.
//

import Foundation

import Foundation

protocol SwiftyGPTChatMessage {
    var role: SwiftyGPTChatRole { get }
}

struct SwiftyGPTSystemMessage: SwiftyGPTChatMessage {
    let role: SwiftyGPTChatRole = .system
    let content: String
    let name: String?
    
    init(content: String, name: String? = nil) {
        self.content = content
        self.name = name
    }
}

struct SwiftyGPTUserMessage: SwiftyGPTChatMessage {
    let role: SwiftyGPTChatRole = .user
    let content: String
    let name: String?
    
    init(content: String, name: String? = nil) {
        self.content = content
        self.name = name
    }
}

struct SwiftyGPTAssistantMessage: SwiftyGPTChatMessage {
    let role: SwiftyGPTChatRole = .assistant
    let content: String?
    let name: String?
    // TODO: Add tool_calls
    
    init(content: String? = nil, name: String? = nil) {
        self.content = content
        self.name = name
    }
}

struct SwiftyGPTToolMessage: SwiftyGPTChatMessage {
    let role: SwiftyGPTChatRole = .tool
    let content: String
    // TODO: Add tool_call_id
    
    init(content: String) {
        self.content = content
    }
}
