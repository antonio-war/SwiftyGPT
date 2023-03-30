//
//  SwiftyGPTImageRequest.swift
//  
//
//  Created by Antonio Guerra on 30/03/23.
//

import Foundation
import SwiftyHTTP

public struct SwiftyGPTImageRequest: SwiftyHTTPRequestBody {
    public let prompt: String
    public let quantity: Int?
    public let size: SwiftyGPTImageSize?
    public let responseFormat: SwiftyGPTImageResponseFormat?
    public let user: String?
    
    enum CodingKeys: String, CodingKey {
        case prompt
        case quantity = "n"
        case size
        case responseFormat = "response_format"
        case user
    }
}

// MARK: - ImageSize
public enum SwiftyGPTImageSize: String, Encodable {
    case x256 = "256x256"
    case x512 = "512x512"
    case x1024 = "1024x1024"
}

// MARK: - ResponseFormat
public enum SwiftyGPTImageResponseFormat: String, Codable {
    case url = "url"
    case b64 = "b64_json"
}
