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
                    "message": "Incorrect API key provided: sk-zVAMH****************************************o25x. You can find your API key at https://platform.openai.com/account/api-keys.",
                    "type": "invalid_request_error",
                    "param": null,
                    "code": "invalid_api_key"
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
