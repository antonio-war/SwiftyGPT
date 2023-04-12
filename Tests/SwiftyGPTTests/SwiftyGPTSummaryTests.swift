//
//  SwiftyGPTSummaryTests.swift
//  
//
//  Created by Antonio Guerra on 12/04/23.
//

import XCTest
@testable import SwiftyGPT

final class SwiftyGPTSummaryTests: SwiftyGPTTestCase {
    
    let text = """
        Jupiter is the fifth planet from the Sun and the largest in the Solar System. It is a gas giant with a mass one-thousandth that of the Sun, but two-and-a-half times that of all the other planets in the Solar System combined. Jupiter is one of the brightest objects visible to the naked eye in the night sky, and has been known to ancient civilizations since before recorded history. It is named after the Roman god Jupiter.[19] When viewed from Earth, Jupiter can be bright enough for its reflected light to cast visible shadows,[20] and is on average the third-brightest natural object in the night sky after the Moon and Venus.
    """
    
    func testDefaultCompletion() throws {
        let expectation = expectation(description: "DefaultCompletion")
        
        swiftyGPT.summary(text: text, language: .english) { result in
            switch result {
            case .success(let response):
                XCTAssertLessThan(response.count, self.text.count)
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
        let result: Result<String, Error> = await swiftyGPT.summary(text: text, language: .english)
        switch result {
        case .success(let response):
            XCTAssertLessThan(response.count, self.text.count)
        case .failure(let error):
            if let error = error as? SwiftyGPTError {
                XCTFail(error.message)
            } else {
                XCTFail(error.localizedDescription)
            }
        }
    }
}
