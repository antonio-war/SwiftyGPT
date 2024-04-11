//
//  SwiftyGPTChatRoleTests.swift
//  
//
//  Created by Antonio Guerra on 09/04/24.
//

@testable import SwiftyGPTChat
import XCTest

final class SwiftyGPTChatRoleTests: XCTestCase {
    
    func testSystemInitFromRawValue() throws {
        let role = try XCTUnwrap(SwiftyGPTChatRole(rawValue: "system"))
        XCTAssertEqual(role, .system)
    }
    
    func testUserInitFromRawValue() throws {
        let role = try XCTUnwrap(SwiftyGPTChatRole(rawValue: "user"))
        XCTAssertEqual(role, .user)
    }
    
    func testAssistantInitFromRawValue() throws {
        let role = try XCTUnwrap(SwiftyGPTChatRole(rawValue: "assistant"))
        XCTAssertEqual(role, .assistant)
    }
    
    func testToolInitFromRawValue() throws {
        let role = try XCTUnwrap(SwiftyGPTChatRole(rawValue: "tool"))
        XCTAssertEqual(role, .tool)
    }
}
