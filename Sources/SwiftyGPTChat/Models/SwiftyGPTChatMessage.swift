//
//  SwiftyGPTChatMessage.swift
//
//
//  Created by Antonio Guerra on 11/04/24.
//

import Foundation

protocol SwiftyGPTChatMessage: Equatable, Encodable {
    var role: SwiftyGPTChatRole { get }
}

struct SwiftyGPTChatSystemMessage: SwiftyGPTChatMessage {
    let role: SwiftyGPTChatRole = .system
    let content: String
    let name: String?
    
    init(content: String, name: String? = nil) {
        self.content = content
        self.name = name
    }
            
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(role, forKey: .role)
        try container.encode(content, forKey: .content)
        try container.encodeIfPresent(name, forKey: .name)
    }
    
    enum CodingKeys: CodingKey {
        case role
        case content
        case name
    }
}

struct SwiftyGPTChatUserMessage: SwiftyGPTChatMessage {
    let role: SwiftyGPTChatRole = .user
    let content: String
    let name: String?

    init(content: String, name: String? = nil) {
        self.content = content
        self.name = name
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(role, forKey: .role)
        try container.encode(content, forKey: .content)
        try container.encodeIfPresent(name, forKey: .name)
    }

    enum CodingKeys: CodingKey {
        case role
        case content
        case name
    }
}

struct SwiftyGPTChatAssistantMessage: SwiftyGPTChatMessage {
    let role: SwiftyGPTChatRole = .assistant
    // TODO: maybe need to manage better content or tool_calls
    let content: String
    let name: String?
    // TODO: add tool_calls

    init(content: String, name: String? = nil) {
        self.content = content
        self.name = name
    }

    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.role, forKey: .role)
        try container.encode(self.content, forKey: .content)
        try container.encodeIfPresent(self.name, forKey: .name)
    }
    
    enum CodingKeys: CodingKey {
        case role
        case content
        case name
    }
}

struct SwiftyGPTChatToolMessage: SwiftyGPTChatMessage {
    let role: SwiftyGPTChatRole = .tool
    let content: String
    // TODO: add tool_call_id

    init(content: String) {
        self.content = content
    }

    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.role, forKey: .role)
        try container.encode(self.content, forKey: .content)
    }
    
    enum CodingKeys: CodingKey {
        case role
        case content
    }
}

enum SwiftyGPTChatCodableMessage: Equatable, Encodable {
    case system(SwiftyGPTChatSystemMessage)
    case user(SwiftyGPTChatUserMessage)
    case assistant(SwiftyGPTChatAssistantMessage)
    case tool(SwiftyGPTChatToolMessage)
    
    func encode(to encoder: any Encoder) throws {
        var singleContainer = encoder.singleValueContainer()
        switch self {
        case .system(let message):
            try singleContainer.encode(message)
        case .user(let message):
            try singleContainer.encode(message)
        case .assistant(let message):
            try singleContainer.encode(message)
        case .tool(let message):
            try singleContainer.encode(message)
        }
    }
}
