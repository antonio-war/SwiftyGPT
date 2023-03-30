//
//  SwiftyGPTImageResponse.swift
//  
//
//  Created by Antonio Guerra on 30/03/23.
//

import Foundation
import SwiftyHTTP

public struct SwiftyGPTImageResponse<ResponseData: SwiftyGPTImageResponseData>: SwiftyHTTPResponseBody {
    public let created: TimeInterval
    public let data: [ResponseData]
}

public protocol SwiftyGPTImageResponseData: Decodable {}

public struct SwiftyGTPImageURLResponseData: SwiftyGPTImageResponseData {
    public let url: String
}

public struct SwiftyGPTB64ResponseData: SwiftyGPTImageResponseData {
    public let b64: String
    
    enum CodingKeys: String, CodingKey {
        case b64 = "b64_json"
    }
}
