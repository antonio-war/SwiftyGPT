//
//  SwiftyGPTChatResponseFinishReason.swift
//
//
//  Created by Antonio Guerra on 27/04/24.
//

import Foundation

enum SwiftyGPTChatResponseFinishReason: String, Decodable {
    case stop
    case lenght
    case contentFilter = "content_filter"
    case toolCalls = "tool_calls"
}
