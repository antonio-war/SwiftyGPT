//
//  RangedTests.swift
//  
//
//  Created by Antonio Guerra on 27/03/23.
//

import XCTest
@testable import SwiftyGPT

final class RangedTests: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    func testPureValue() throws {
        @Ranged(0...2) var temperature: Float? = 1.0
        XCTAssertEqual(temperature, 1.0)
    }
    
    func testMinValue() throws {
        @Ranged(0...2) var temperature: Float? = -1.0
        XCTAssertEqual(temperature, 0.0)
    }
    
    func testMaxValue() throws {
        @Ranged(0...2) var temperature: Float? = 3.0
        XCTAssertEqual(temperature, 2.0)
    }
}
