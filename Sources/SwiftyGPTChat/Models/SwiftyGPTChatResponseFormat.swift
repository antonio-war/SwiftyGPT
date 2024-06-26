//
//  SwiftyGPTChatResponseFormat.swift
//  
//
//  Created by Antonio Guerra on 27/04/24.
//

import Foundation

public enum SwiftyGPTChatResponseFormat: String, Encodable {
    case text = "text"
    case json = "json_object"
    
    enum CodingKeys: CodingKey {
        case type
    }
    
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(rawValue, forKey: .type)
    }
}
