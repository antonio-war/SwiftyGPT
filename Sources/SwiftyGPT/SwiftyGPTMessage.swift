//
//  SwiftyGPTMessage.swift
//  
//
//  Created by Antonio Guerra on 27/03/23.
//

import Foundation

public struct SwiftyGPTMessage: Codable {
//    public private(set) var id: UUID = UUID()
    let role: SwiftyGPTRole
    let content: String
}

// MARK: - Role
public enum SwiftyGPTRole: String, Codable {
    case system
    case user
    case assistant
}
