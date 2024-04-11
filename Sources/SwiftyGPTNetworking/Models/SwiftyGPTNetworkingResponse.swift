//
//  SwiftyGPTNetworkingResponse.swift
//
//
//  Created by Antonio Guerra on 11/04/24.
//

import Foundation

struct SwiftyGPTNetworkingResponse {
    var underlyingResponse: HTTPURLResponse
    var body: Data
    
    var statusCode: Int {
        return underlyingResponse.statusCode
    }
}
