//
//  SwiftyGPTChatModelTests.swift
//
//
//  Created by Antonio Guerra on 11/04/24.
//

@testable import SwiftyGPTChat
import XCTest

final class SwiftyGPTChatModelTests: XCTestCase {
    
    func testGpt4_turboInitFromRawValue() throws {
        let model = try XCTUnwrap(SwiftyGPTChatModel(rawValue: "gpt-4-turbo"))
        XCTAssertEqual(model, .gpt4_turbo)
    }
    
    func testGpt4_turbo_previewInitFromRawValue() throws {
        let model = try XCTUnwrap(SwiftyGPTChatModel(rawValue: "gpt-4-turbo-preview"))
        XCTAssertEqual(model, .gpt4_turbo_preview)
    }
    
    func testGpt4_0125_previewInitFromRawValue() throws {
        let model = try XCTUnwrap(SwiftyGPTChatModel(rawValue: "gpt-4-0125-preview"))
        XCTAssertEqual(model, .gpt4_0125_preview)
    }
    
    func testGpt4_1106_previewInitFromRawValue() throws {
        let model = try XCTUnwrap(SwiftyGPTChatModel(rawValue: "gpt-4-1106-preview"))
        XCTAssertEqual(model, .gpt4_1106_preview)
    }
    
    func testGpt4InitFromRawValue() throws {
        let model = try XCTUnwrap(SwiftyGPTChatModel(rawValue: "gpt-4"))
        XCTAssertEqual(model, .gpt4)
    }
    
    func testGpt4_0613InitFromRawValue() throws {
        let model = try XCTUnwrap(SwiftyGPTChatModel(rawValue: "gpt-4-0613"))
        XCTAssertEqual(model, .gpt4_0613)
    }
    
    func testGpt4_32kInitFromRawValue() throws {
        let model = try XCTUnwrap(SwiftyGPTChatModel(rawValue: "gpt-4-32k"))
        XCTAssertEqual(model, .gpt4_32k)
    }
    
    func testGpt4_32k_0613InitFromRawValue() throws {
        let model = try XCTUnwrap(SwiftyGPTChatModel(rawValue: "gpt-4-32k-0613"))
        XCTAssertEqual(model, .gpt4_32k_0613)
    }
    
    func testGpt3_5_turboInitFromRawValue() throws {
        let model = try XCTUnwrap(SwiftyGPTChatModel(rawValue: "gpt-3.5-turbo"))
        XCTAssertEqual(model, .gpt3_5_turbo)
    }
    
    func testGpt3_5_turbo_16kInitFromRawValue() throws {
        let model = try XCTUnwrap(SwiftyGPTChatModel(rawValue: "gpt-3.5-turbo-16k"))
        XCTAssertEqual(model, .gpt3_5_turbo_16k)
    }
    
    func testGpt3_5_turbo_16k_0613InitFromRawValue() throws {
        let model = try XCTUnwrap(SwiftyGPTChatModel(rawValue: "gpt-3.5-turbo-16k-0613"))
        XCTAssertEqual(model, .gpt3_5_turbo_16k_0613)
    }
    
    func testGpt3_5_turbo_0301InitFromRawValue() throws {
        let model = try XCTUnwrap(SwiftyGPTChatModel(rawValue: "gpt-3.5-turbo-0301"))
        XCTAssertEqual(model, .gpt3_5_turbo_0301)
    }
    
    func testGpt3_5_turbo_0613InitFromRawValue() throws {
        let model = try XCTUnwrap(SwiftyGPTChatModel(rawValue: "gpt-3.5-turbo-0613"))
        XCTAssertEqual(model, .gpt3_5_turbo_0613)
    }
    
    func testGpt3_5_turbo_1106InitFromRawValue() throws {
        let model = try XCTUnwrap(SwiftyGPTChatModel(rawValue: "gpt-3.5-turbo-1106"))
        XCTAssertEqual(model, .gpt3_5_turbo_1106)
    }
    
    func testGpt3_5_turbo_0125InitFromRawValue() throws {
        let model = try XCTUnwrap(SwiftyGPTChatModel(rawValue: "gpt-3.5-turbo-0125"))
        XCTAssertEqual(model, .gpt3_5_turbo_0125)
    }
}

