//
//  SwiftyGTPCorrectionTests.swift
//  
//
//  Created by Antonio Guerra on 13/04/23.
//

import XCTest
@testable import SwiftyGPT

final class SwiftyGTPCorrectionTests: SwiftyGPTTestCase {
    
    func testDefaultCompletion() throws {
        let expectation = expectation(description: "DefaultCompletion")
        swiftyGPT.correction(text: "She no went to the market", language: .english) { result in
            switch result {
            case .success(let response):
                XCTAssertEqual(response.lowercased(), "she did not go to the market.")
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
        let result: Result<String, Error> = await swiftyGPT.correction(text: "She no went to the market", language: .english)
        switch result {
        case .success(let response):
            XCTAssertEqual(response.lowercased(), "she did not go to the market.")
        case .failure(let error):
            if let error = error as? SwiftyGPTError {
                XCTFail(error.message)
            } else {
                XCTFail(error.localizedDescription)
            }
        }
    }
}
