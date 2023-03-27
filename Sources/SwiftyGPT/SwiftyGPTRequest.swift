//
//  SwiftyGPTRequest.swift
//  
//
//  Created by Antonio Guerra on 27/03/23.
//

import Foundation
import SwiftyHTTP

public struct SwiftyGPTRequest: SwiftyHTTPBody {
    let model: SwiftyGPTModel
    let messages: [SwiftyGPTMessage]
}