//
//  SwiftyGPTImageResponse.swift
//  
//
//  Created by Antonio Guerra on 30/03/23.
//

import Foundation
import SwiftyHTTP

struct SwiftyGPTImageResponse<ResponseData: SwiftyGPTImageResponseData>: SwiftyHTTPResponseBody {
    let created: TimeInterval
    let data: [ResponseData]
}

protocol SwiftyGPTImageResponseData: Decodable {}

struct SwiftyGTPImageURLResponseData: SwiftyGPTImageResponseData {
    let url: String
}

struct SwiftyGPTB64ResponseData: SwiftyGPTImageResponseData {
    let b64: String
    
    enum CodingKeys: String, CodingKey {
        case b64 = "b64_json"
    }
}
