//
//  SwiftyGPTChatMessage.swift
//
//
//  Created by Antonio Guerra on 11/04/24.
//

import Foundation

public protocol SwiftyGPTChatMessage: Identifiable, Equatable, Encodable, Decodable, Hashable {
    var id: UUID { get }
    var role: SwiftyGPTChatRole { get }
}

public struct SwiftyGPTChatSystemMessage: SwiftyGPTChatMessage {
    public let id: UUID = UUID()
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

public struct SwiftyGPTChatUserMessage: SwiftyGPTChatMessage {
    public let id: UUID = UUID()
    public let role: SwiftyGPTChatRole = .user
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

public struct SwiftyGPTChatAssistantMessage: SwiftyGPTChatMessage {
    public let id: UUID = UUID()
    public let role: SwiftyGPTChatRole = .assistant
    // TODO: content will be optional once tool_calls parameter will be supported
    public let content: String
    public let name: String?
    // TODO: add tool_calls parameter support

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

public struct SwiftyGPTChatToolMessage: SwiftyGPTChatMessage {
    public let id: UUID = UUID()
    public let role: SwiftyGPTChatRole = .tool
    public let content: String
    // TODO: add tool_call_id

    public init(content: String) {
        self.content = content
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.content = try container.decode(String.self, forKey: .content)
    }
    
    public func encode(to encoder: any Encoder) throws {
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
