//
//  SwiftyGPTErrorTests.swift
//  
//
//  Created by Antonio Guerra on 29/03/23.
//

import XCTest
@testable import SwiftyGPT

final class SwiftyGPTErrorTests: XCTestCase {
    
    var jsonString: String!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        jsonString = """
            {
              "error": {
                "message": "This model's maximum context length is 4097 tokens, however you requested 4451 tokens (357 in your prompt; 4094 for the completion). Please reduce your prompt; or completion length.",
                "type": "invalid_request_error",
                "param": null,
                "code": null
              }
            }
        """
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        jsonString = nil
    }

    func testDecode() throws {
        let data = jsonString.data(using: .utf8)
        XCTAssertNotNil(data)
        let error = try JSONDecoder().decode(SwiftyGPTError.self, from: data!)
        XCTAssertNotNil(error)
    }
}
