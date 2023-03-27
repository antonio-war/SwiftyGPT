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
    
    func testDefaultChatCompletion() {
        let expectation = expectation(description: "DefaultChatCompletion")
        var result: Result<SwiftyGPTResponse, Error>? = nil
        swiftyGPT.chat(messages: [SwiftyGPTMessage(role: .user, content: "Hi, how are you?")], temperature: 5) { response in
            result = response
            expectation.fulfill()
        }
        waitForExpectations(timeout: 30, handler: nil)
        
        XCTAssertNotNil(result)
        
        XCTAssertNoThrow(try result!.get())
    }
}
