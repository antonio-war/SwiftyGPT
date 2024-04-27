//
//  SwiftyGPTChatNetworkingServiceTests.swift
//  
//
//  Created by Antonio Guerra on 26/04/24.
//

import XCTest
@testable import SwiftyGPTChat
@testable import SwiftyGPTNetworking

final class SwiftyGPTChatNetworkingServiceTests: XCTestCase {
    
    func testInit() {
        let client = SwiftyGPTNetworkingClient()
        let apiKey = "testApiKey"
        let organization = "testOrganization"
        let service = SwiftyGPTChatNetworkingService(client: client, apiKey: apiKey, organization: organization)
        XCTAssertEqual(service.client, client)
        XCTAssertEqual(service.apiKey, apiKey)
        XCTAssertEqual(service.organization, organization)
    }
}
