//
//  SwiftyGPTMessage.swift
//  
//
//  Created by Antonio Guerra on 27/03/23.
//

import Foundation

struct SwiftyGPTMessage: Codable, Identifiable {
    let id: UUID = UUID()
    let role: SwiftyGPTRole
    let content: String
}
