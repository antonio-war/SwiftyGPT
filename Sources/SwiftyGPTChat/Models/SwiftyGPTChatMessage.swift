//
//  SwiftyGPTChatMessage.swift
//
//
//  Created by Antonio Guerra on 11/04/24.
//

import Foundation

protocol SwiftyGPTChatMessage: Equatable, Encodable, Decodable {
    var role: SwiftyGPTChatRole { get }
}

public struct SwiftyGPTChatSystemMessage: SwiftyGPTChatMessage {
    public let role: SwiftyGPTChatRole = .system
    public let content: String
    public let name: String?
    
    public init(content: String, name: String? = nil) {
        self.content = content
        self.name = name
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.content = try container.decode(String.self, forKey: .content)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
    }
            
    public func encode(to encoder: any Encoder) throws {
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
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.content = try container.decode(String.self, forKey: .content)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
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
    // TODO: content will be optional once tool_calls parameter will be supported
    let content: String
    let name: String?
    // TODO: add tool_calls parameter support

    init(content: String, name: String? = nil) {
        self.content = content
        self.name = name
    }

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.content = try container.decode(String.self, forKey: .content)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
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

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.content = try container.decode(String.self, forKey: .content)
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

enum SwiftyGPTChatCodableMessage: Equatable, Encodable, Decodable {
    case system(SwiftyGPTChatSystemMessage)
    case user(SwiftyGPTChatUserMessage)
    case assistant(SwiftyGPTChatAssistantMessage)
    case tool(SwiftyGPTChatToolMessage)
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let singleContainer = try decoder.singleValueContainer()
        let role = try container.decode(SwiftyGPTChatRole.self, forKey: .role)
        switch role {
        case .system:
            let message = try singleContainer.decode(SwiftyGPTChatSystemMessage.self)
            self = .system(message)
        case .user:
            let message = try singleContainer.decode(SwiftyGPTChatUserMessage.self)
            self = .user(message)
        case .assistant:
            let message = try singleContainer.decode(SwiftyGPTChatAssistantMessage.self)
            self = .assistant(message)
        case .tool:
            let message = try singleContainer.decode(SwiftyGPTChatToolMessage.self)
            self = .tool(message)
        }
    }
    
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
    
    enum CodingKeys: CodingKey {
        case role
    }
}
