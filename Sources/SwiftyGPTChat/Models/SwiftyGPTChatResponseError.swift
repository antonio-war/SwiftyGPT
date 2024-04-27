//
//  SwiftyGPTChatResponseError.swift
//
//
//  Created by Antonio Guerra on 27/04/24.
//

import Foundation

struct SwiftyGPTChatResponseError: Decodable, Equatable {
    let type: String
    let message: String
}
