//
//  SwiftyGPTRoleTests.swift
//  
//
//  Created by Antonio Guerra on 09/04/24.
//

@testable import SwiftyGPT
import XCTest

final class SwiftyGPTRoleTests: XCTestCase {
    
    func testSystemInitFromRawValue() throws {
        let role = try XCTUnwrap(SwiftyGPTRole(rawValue: "system"))
        XCTAssertEqual(role, .system)
    }
    
    func testUserInitFromRawValue() throws {
        let role = try XCTUnwrap(SwiftyGPTRole(rawValue: "user"))
        XCTAssertEqual(role, .user)
    }
    
    func testAssistantInitFromRawValue() throws {
        let role = try XCTUnwrap(SwiftyGPTRole(rawValue: "assistant"))
        XCTAssertEqual(role, .assistant)
    }
    
    func testToolInitFromRawValue() throws {
        let role = try XCTUnwrap(SwiftyGPTRole(rawValue: "tool"))
        XCTAssertEqual(role, .tool)
    }
}
