//
//  SwiftyGPTRequest.swift
//  
//
//  Created by Antonio Guerra on 27/03/23.
//

import Foundation
import SwiftyHTTP

public struct SwiftyGPTRequest: SwiftyHTTPBody {
    let messages: [SwiftyGPTMessage]
    let model: SwiftyGPTModel
    let temperature: Int
    let choices: Int
    let stream: Bool
    let user: String?
    
    enum CodingKeys: String, CodingKey {
        case model
        case messages
        case temperature
        case choices = "n"
        case stream
        case user
    }
}
