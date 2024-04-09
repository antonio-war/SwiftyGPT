//
//  SwiftyGPTSystemMessage.swift
//
//
//  Created by Antonio Guerra on 09/04/24.
//

import Foundation

struct SwiftyGPTSystemMessage: SwiftyGPTMessage {
    let role: SwiftyGPTRole = .system
    let content: String
    let name: String?
    
    init(content: String, name: String? = nil) {
        self.content = content
        self.name = name
    }
}
