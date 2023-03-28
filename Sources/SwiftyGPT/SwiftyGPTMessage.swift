//
//  SwiftyGPTMessage.swift
//  
//
//  Created by Antonio Guerra on 27/03/23.
//

import Foundation

public struct SwiftyGPTMessage: Codable, Identifiable, Datable {
    public let id: UUID = UUID()
    public let date: Date = Date()
    public let role: SwiftyGPTRole
    public let content: String
    
    enum CodingKeys: String, CodingKey {
        case role
        case content
    }
    
    public init(role: SwiftyGPTRole, content: String) {
        self.role = role
        self.content = content
    }
    
    public init(content: String) {
        self.role = .user
        self.content = content
    }
}

// MARK: - Role
public enum SwiftyGPTRole: String, Codable {
    case system
    case user
    case assistant
}
