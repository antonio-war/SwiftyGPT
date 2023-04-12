//
//  SwiftyGPTRequest.swift
//  
//
//  Created by Antonio Guerra on 11/04/23.
//

import Foundation
import SwiftyHTTP

protocol SwiftyGPTRequest: SwiftyHTTPRequestBody {
    associatedtype GPTModel: SwiftyGPTModel
    
    var model: GPTModel { get }
    var user: String? { get }
    var choices: Int? { get }
    var maxTokens: Int? { get }
    var temperature: Float? { get }
    var stream: Bool? { get }
    var presencePenalty: Float? { get }
    var frequencyPenalty: Float? { get }
}
