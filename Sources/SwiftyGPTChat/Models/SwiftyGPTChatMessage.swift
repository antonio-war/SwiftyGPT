//
//  SwiftyGPTChatMessage.swift
//
//
//  Created by Antonio Guerra on 11/04/24.
//

import Foundation

enum SwiftyGPTChatMessage: Encodable {
    case system(SwiftyGPTSystemMessageContent)
    case user(SwiftyGPTUserMessageContent)
    case assistant(SwiftyGPTAssistantMessageContent)
    case tool(SwiftyGPTToolMessageContent)
    
    func encode(to encoder: any Encoder) throws {
        var singleContainer = encoder.singleValueContainer()
        switch self {
        case .system(let content):
            try singleContainer.encode(content)
        case .user(let content):
            try singleContainer.encode(content)
        case .assistant(let content):
            try singleContainer.encode(content)
        case .tool(let content):
            try singleContainer.encode(content)
        }
    }
    
    protocol Content: Encodable {}
}

struct SwiftyGPTSystemMessageContent: SwiftyGPTChatMessage.Content {
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

struct SwiftyGPTUserMessageContent: SwiftyGPTChatMessage.Content {
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

struct SwiftyGPTAssistantMessageContent: SwiftyGPTChatMessage.Content {
    let role: SwiftyGPTChatRole = .assistant
    let content: String?
    let name: String?
    // TODO: add tool_calls

    init(content: String? = nil, name: String? = nil) {
        self.content = content
        self.name = name
    }

    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.role, forKey: .role)
        try container.encodeIfPresent(self.content, forKey: .content)
        try container.encodeIfPresent(self.name, forKey: .name)
    }
    
    enum CodingKeys: CodingKey {
        case role
        case content
        case name
    }
}

struct SwiftyGPTToolMessageContent: SwiftyGPTChatMessage.Content {
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
