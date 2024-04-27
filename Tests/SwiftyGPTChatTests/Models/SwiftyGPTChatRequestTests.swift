//
//  SwiftyGPTChatRequestTests.swift
//  
//
//  Created by Antonio Guerra on 15/04/24.
//

@testable import SwiftyGPTChat
import XCTest

final class SwiftyGPTChatRequestTests: XCTestCase {
    
    func testInitWhenOrganizationIsNil() throws {
        let request = SwiftyGPTChatRequest(apiKey: "Test", body: Data())
        XCTAssertEqual(request.endpoint, URL(string: "https://api.openai.com/"))
        XCTAssertEqual(request.path, "v1/chat/completions")
        XCTAssertEqual(request.method, .post)
        XCTAssertEqual(request.headers, [
            "Content-Type": "application/json",
            "Authorization": "Bearer Test"
        ])
        XCTAssertEqual(request.cachePolicy, .reloadIgnoringLocalCacheData)
        XCTAssertEqual(request.timeout, 60.0)
        XCTAssertEqual(request.body, Data())
        try XCTAssertEqual(request.url.absoluteString, "https://api.openai.com/v1/chat/completions")
    }
    
    func testInitWhenOrganizationIsNotNil() throws {
        let request = SwiftyGPTChatRequest(apiKey: "Test", organization: "Test", body: Data())
        XCTAssertEqual(request.endpoint, URL(string: "https://api.openai.com/"))
        XCTAssertEqual(request.path, "v1/chat/completions")
        XCTAssertEqual(request.method, .post)
        XCTAssertEqual(request.headers, [
            "Content-Type": "application/json",
            "Authorization": "Bearer Test",
            "OpenAI-Organization": "Test"
        ])
        XCTAssertEqual(request.cachePolicy, .reloadIgnoringLocalCacheData)
        XCTAssertEqual(request.timeout, 60.0)
        XCTAssertEqual(request.body, Data())
        try XCTAssertEqual(request.url.absoluteString, "https://api.openai.com/v1/chat/completions")
    }
}
