import XCTest
@testable import SwiftyGPT

final class SwiftyGPTTests: XCTestCase {
    private var swiftyGPT: SwiftyGPT!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        swiftyGPT = SwiftyGPT(apiKey: "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")
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        swiftyGPT = nil
    }
}
