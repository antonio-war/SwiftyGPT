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
        swiftyGPT = SwiftyGPT(apiKey: try apiKey)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        swiftyGPT = nil
    }

    func testDefaultCompletion() throws {
        let expectation = expectation(description: "DefaultImageCompletion")
        var result: Result<[Data], Error>? = nil
        swiftyGPT.image(prompt: "Draw an unicorn", choices: 2, size: .x256) { response in
            result = response
            expectation.fulfill()
        }
        waitForExpectations(timeout: 30, handler: nil)
        
        XCTAssertNotNil(result)
        XCTAssertNoThrow(try result?.get())
        
        XCTAssertEqual(try result?.get().count, 2)
        
        let data = try result!.get().first!
        let image = UIImage(data: data)
        XCTAssertNotNil(image)
    }
}
