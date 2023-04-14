//
//  SwiftyGPTSentimentTests.swift
//  
//
//  Created by Antonio Guerra on 13/04/23.
//

import XCTest
@testable import SwiftyGPT

final class SwiftyGPTSentimentTests: SwiftyGPTTestCase {
    
    func testDefaultCompletion() throws {
        let expectation = expectation(description: "DefaultCompletion")
        swiftyGPT.sentiment(text: "I loved the new Batman movie!", language: .english) { result in
            switch result {
            case .success(let response):
                XCTAssertEqual(response, .positive)
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
        let result: Result<SwiftyGPTSentiment, Error> = await swiftyGPT.sentiment(text: "I loved the new Batman movie!", language: .english)
        switch result {
        case .success(let response):
            XCTAssertEqual(response, .positive)
        case .failure(let error):
            if let error = error as? SwiftyGPTError {
                XCTFail(error.message)
            } else {
                XCTFail(error.localizedDescription)
            }
        }
    }
}
