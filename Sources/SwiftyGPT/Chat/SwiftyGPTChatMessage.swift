//
//  SwiftyGPTChatMessage.swift
//  
//
//  Created by Antonio Guerra on 27/03/23.
//

import Foundation

public struct SwiftyGPTChatMessage: Codable, Identifiable {
    public let id: UUID = UUID()
    public let date: Date = Date()
    public let role: SwiftyGPTChatRole
    public let content: String
    
    enum CodingKeys: String, CodingKey {
        case role
        case content
    }
    
    public init(role: SwiftyGPTChatRole, content: String) {
        self.role = role
        self.content = content
    }
    
    public init(content: String) {
        self.role = .user
        self.content = content
    }
}
