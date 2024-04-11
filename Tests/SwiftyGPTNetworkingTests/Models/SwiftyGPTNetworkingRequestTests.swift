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
        XCTAssertEqual(request.method, .get)
        XCTAssertEqual(request.body, Data())
        XCTAssertEqual(request.headers, ["Key":"Value"])
        XCTAssertEqual(request.cachePolicy, .reloadIgnoringLocalAndRemoteCacheData)
        XCTAssertEqual(request.timeout, 60)
        try XCTAssertEqual(request.url.absoluteString, "https://picsum.photos/10")
        try XCTAssertEqual(request.underlyingRequest.url, URL(string: request.url.absoluteString))
        try XCTAssertEqual(request.underlyingRequest.httpMethod, request.method.rawValue)
        try XCTAssertEqual(request.underlyingRequest.httpBody, request.body)
        try XCTAssertEqual(request.underlyingRequest.allHTTPHeaderFields, request.headers)
        try XCTAssertEqual(request.underlyingRequest.cachePolicy, request.cachePolicy)
        try XCTAssertEqual(request.underlyingRequest.timeoutInterval, request.timeout)
    }
        
    func testInitWhenRequestIsInvalid() {
        let request = InvalidTestSwiftyGPTNetworkingRequest()
        try XCTAssertThrowsError(request.url)
        try XCTAssertThrowsError(request.underlyingRequest)
    }
    
    private struct TestSwiftyGPTNetworkingRequest: SwiftyGPTNetworkingRequest {
        let endpoint: URL? = URL(string: "https://picsum.photos/")
        let path: String = "10"
        let method: SwiftyGPTNetworkingMethod = .get
        let body: Data? = Data()
        let headers: [String : String] = ["Key":"Value"]
        let cachePolicy: URLRequest.CachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        let timeout: TimeInterval = 60
    }
    
    private struct InvalidTestSwiftyGPTNetworkingRequest: SwiftyGPTNetworkingRequest {
        let endpoint: URL? = URL(string: "file://picsum.photos/")
        let path: String = "10"
        let method: SwiftyGPTNetworkingMethod = .get
        let body: Data? = Data()
        let headers: [String : String] = ["Key":"Value"]
        let cachePolicy: URLRequest.CachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        let timeout: TimeInterval = 60
    }
}
