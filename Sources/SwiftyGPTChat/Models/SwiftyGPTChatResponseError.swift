//
//  SwiftyGPTChatResponseError.swift
//
//
//  Created by Antonio Guerra on 27/04/24.
//

import Foundation

public struct SwiftyGPTChatResponseError: Decodable, Equatable, Error {
    public let type: String
    public let message: String
    
    public init(type: String, message: String) {
        self.type = type
        self.message = message
    }
}
