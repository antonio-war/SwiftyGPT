//
//  SwiftyGPTImageTests.swift
//  
//
//  Created by Antonio Guerra on 30/03/23.
//

import XCTest
@testable import SwiftyGPT

final class SwiftyGPTImageTests: XCTestCase, SwiftyGPTSecureTest {
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
        let expectation = expectation(description: "DefaultImageCompletion")
        swiftyGPT.image(prompt: "Draw an unicorn", choices: 2, size: .x256) { result in
            switch result {
            case .success(let images):
                XCTAssertEqual(images.count, 2)
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
        let result: Result<[UIImage], Error> = await swiftyGPT.image(prompt: "Draw an unicorn", choices: 2, size: .x256)
        switch result {
        case .success(let images):
            XCTAssertEqual(images.count, 2)
        case .failure(let error):
            if let error = error as? SwiftyGPTError {
                XCTFail(error.message)
            } else {
                XCTFail(error.localizedDescription)
            }
        }
    }
    
    func testSingleCompletion() throws {
        let expectation = expectation(description: "SingleImageCompletion")
        swiftyGPT.image(prompt: "Draw an unicorn", size: .x256) { result in
            switch result {
            case .success(let image):
                XCTAssertNotNil(image)
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
    
    func testSingleAsync() async throws {
        let result: Result<UIImage, Error> = await swiftyGPT.image(prompt: "Draw an unicorn", size: .x256)
        switch result {
        case .success(let image):
            XCTAssertNotNil(image)
        case .failure(let error):
            if let error = error as? SwiftyGPTError {
                XCTFail(error.message)
            } else {
                XCTFail(error.localizedDescription)
            }
        }
    }
}
