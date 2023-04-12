//
//  SwiftyGPTCompletionTests.swift
//  
//
//  Created by Antonio Guerra on 12/04/23.
//

import XCTest
@testable import SwiftyGPT

final class SwiftyGPTCompletionTests: XCTestCase, SwiftyGPTSecureTest {
    
    private var swiftyGPT: SwiftyGPT!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        swiftyGPT = SwiftyGPT(apiKey: apiKey)
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        swiftyGPT = nil
    }
    
    func testDefaultCompletion() throws {
        let expectation = expectation(description: "DefaultCompletion")
        swiftyGPT.completion(prompt: "Say \"Hello\" in italian") { result in
            switch result {
            case .success(let response):
                print(response.choices.first?.text)
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
}
