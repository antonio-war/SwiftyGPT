//
//  SwiftyGPTTranslationTests.swift
//  
//
//  Created by Antonio Guerra on 12/04/23.
//

import XCTest
@testable import SwiftyGPT

final class SwiftyGPTTranslationTests: SwiftyGPTTestCase {
    
    func testDefaultCompletion() throws {
        let expectation = expectation(description: "DefaultCompletion")
        swiftyGPT.translation(text: "Hello", from: .english, to: .italian) { result in
            switch result {
            case .success(let response):
                XCTAssertEqual(response.lowercased(), "ciao")
            case .failure(let error):
                if let error = error as? SwiftyGPTError {
                    XCTFail(error.message)
                } else {
                    XCTFail(error.localizedDescription)
                }
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 30, handler: nil)
    }
    
    func testDefaultAsync() async throws {
        let result: Result<String, Error> = await swiftyGPT.translation(text: "Hello", from: .english, to: .italian)
        switch result {
        case .success(let response):
            XCTAssertEqual(response.lowercased(), "ciao")
        case .failure(let error):
            if let error = error as? SwiftyGPTError {
                XCTFail(error.message)
            } else {
                XCTFail(error.localizedDescription)
            }
        }
    }
}
