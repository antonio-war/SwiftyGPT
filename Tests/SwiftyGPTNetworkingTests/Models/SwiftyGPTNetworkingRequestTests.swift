//
//  SwiftyGPTNetworkingRequestTests.swift
//  
//
//  Created by Antonio Guerra on 11/04/24.
//

import XCTest
@testable import SwiftyGPTNetworking

final class SwiftyGPTNetworkingRequestTests: XCTestCase {

    func testInit() throws {
        let request = TestSwiftyGPTNetworkingRequest()
        XCTAssertEqual(request.endpoint, URL(string: "https://picsum.photos/"))
        XCTAssertEqual(request.path, "10")
        XCTAssertEqual(request.cachePolicy, .reloadIgnoringLocalAndRemoteCacheData)
        XCTAssertEqual(request.timeout, 60)
        try XCTAssertEqual(request.url, URL(string: request.path, relativeTo: request.endpoint))
        try XCTAssertEqual(request.underlyingRequest, URLRequest(url: request.url, cachePolicy: request.cachePolicy, timeoutInterval: request.timeout))
    }
    
    private struct TestSwiftyGPTNetworkingRequest: SwiftyGPTNetworkingRequest {
        let endpoint: URL? = URL(string: "https://picsum.photos/")
        let path: String = "10"
        let cachePolicy: URLRequest.CachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        let timeout: TimeInterval = 60
    }
}
