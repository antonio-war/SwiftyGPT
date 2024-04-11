//
//  SwiftyGPTNetworkingRequest.swift
//
//
//  Created by Antonio Guerra on 11/04/24.
//

import Foundation

protocol SwiftyGPTNetworkingRequest {
    var endpoint: URL? { get }
    var path: String { get }
    var url: URL { get throws }
    var cachePolicy: URLRequest.CachePolicy { get }
    var timeout: TimeInterval { get }
    var underlyingRequest: URLRequest { get throws }
}

extension SwiftyGPTNetworkingRequest {
    var url: URL {
        get throws {
            guard let endpoint, let url = URL(string: path, relativeTo: endpoint) else {
                throw URLError(.badURL)
            }
            return url
        }
    }
    
    var underlyingRequest: URLRequest {
        get throws {
            return try URLRequest(url: url, cachePolicy: cachePolicy, timeoutInterval: timeout)
        }
    }
}
