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

struct SwiftyGPTSystemMessage: SwiftyGPTChatMessage {
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

struct SwiftyGPTUserMessage: SwiftyGPTChatMessage {
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

struct SwiftyGPTAssistantMessage: SwiftyGPTChatMessage {
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

struct SwiftyGPTToolMessage: SwiftyGPTChatMessage {
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
    case system(SwiftyGPTSystemMessage)
    case user(SwiftyGPTUserMessage)
    case assistant(SwiftyGPTAssistantMessage)
    case tool(SwiftyGPTToolMessage)
    
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
    
    static func == (lhs: SwiftyGPTChatCodableMessage, rhs: SwiftyGPTChatCodableMessage) -> Bool {
        switch (lhs, rhs) {
        case (.system(let lhsMessage), .system(let rhsMessage)):
            return lhsMessage == rhsMessage
        case (.user(let lhsMessage), .user(let rhsMessage)):
            return lhsMessage == rhsMessage
        case (.assistant(let lhsMessage), .assistant(let rhsMessage)):
            return lhsMessage == rhsMessage
        case (.tool(let lhsMessage), .tool(let rhsMessage)):
            return lhsMessage == rhsMessage
        default:
            return false
        }
    }
}
