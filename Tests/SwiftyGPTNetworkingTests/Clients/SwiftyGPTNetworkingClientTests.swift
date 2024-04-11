//
//  SwiftyGPTNetworkingClientTests.swift
//  
//
//  Created by Antonio Guerra on 11/04/24.
//

@testable import SwiftyGPTNetworking
import XCTest

final class SwiftyGPTNetworkingClientTests: XCTestCase {

    var client: SwiftyGPTNetworkingClient!
    
    override func setUpWithError() throws {
        self.client = SwiftyGPTNetworkingClient(session: URLSession.shared)
    }

    override func tearDownWithError() throws {
        self.client = nil
    }

    func testSend() async throws {
        let request = TestSwiftyGPTNetworkingRequest()
        let response = try await client.send(request: request)
        XCTAssertEqual(response.statusCode, 200)
        let _ = try XCTUnwrap(UIImage(data: response.body))
    }
    
    private struct TestSwiftyGPTNetworkingRequest: SwiftyGPTNetworkingRequest {
        let endpoint: URL? = URL(string: "https://picsum.photos/")
        let path: String = "10"
        let method: SwiftyGPTNetworkingMethod = .get
        let body: Data? = nil
        let headers: [String : String] = [:]
        let cachePolicy: URLRequest.CachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        let timeout: TimeInterval = 60
    }
}
