//
//  SwiftyGPTChatRole.swift
//
//
//  Created by Antonio Guerra on 09/04/24.
//

import Foundation

public enum SwiftyGPTChatRole: String, Encodable, Decodable {
    case system
    case user
    case assistant
    case tool
}
