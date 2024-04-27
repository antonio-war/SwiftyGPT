//
//  SwiftyGPTNetworkingResponse.swift
//
//
//  Created by Antonio Guerra on 11/04/24.
//

import Foundation

public struct SwiftyGPTNetworkingResponse {
    public var underlyingResponse: HTTPURLResponse
    public var body: Data
    
    public var statusCode: Int {
        return underlyingResponse.statusCode
    }
}
