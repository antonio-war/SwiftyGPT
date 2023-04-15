//
//  SwiftyGPTTestCase.swift
//  
//
//  Created by Antonio Guerra on 12/04/23.
//

import XCTest
@testable import SwiftyGPT

class SwiftyGPTTestCase: XCTestCase, SwiftyGPTSecureTest {
    
    var swiftyGPT: SwiftyGPT!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        swiftyGPT = SwiftyGPT(apiKey: apiKey)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        swiftyGPT = nil
    }
}
