//
//  SwiftyGPTCompletionTests.swift
//  
//
//  Created by Antonio Guerra on 12/04/23.
//

import XCTest
@testable import SwiftyGPT

final class SwiftyGPTCompletionTests: SwiftyGPTTestCase {
    
    func testDefaultCompletion() throws {
        let expectation = expectation(description: "DefaultCompletion")
        swiftyGPT.completion(prompt: "Say \"Hello\" in italian") { result in
            switch result {
            case .success(let response):
                XCTAssertGreaterThanOrEqual(response.choices.count, 1)
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
        let result: Result<SwiftyGPTCompletionResponse, Error> = await swiftyGPT.completion(prompt: "Say \"Hello\" in italian")
        switch result {
        case .success(let response):
            XCTAssertGreaterThanOrEqual(response.choices.count, 1)
        case .failure(let error):
            if let error = error as? SwiftyGPTError {
                XCTFail(error.message)
            } else {
                XCTFail(error.localizedDescription)
            }
        }
    }
}
