import XCTest
@testable import SwiftyGPT

final class SwiftyGPTChatTests: XCTestCase {
    private var swiftyGPT: SwiftyGPT!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        swiftyGPT = SwiftyGPT(apiKey: "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")
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        swiftyGPT = nil
    }
    
    func testDefaultCompletion() {
        let expectation = expectation(description: "DefaultChatCompletion")
        var result: Result<SwiftyGPTResponse, Error>? = nil
        swiftyGPT.chat(messages: [SwiftyGPTMessage(role: .user, content: "Hi, how are you?")]) { response in
            result = response
            expectation.fulfill()
        }
        waitForExpectations(timeout: 30, handler: nil)
        
        XCTAssertNotNil(result)
        XCTAssertNoThrow(try result?.get())
    }
    
    func testDefaultAsync() async {
        let result: Result<SwiftyGPTResponse, Error> = await swiftyGPT.chat(messages: [SwiftyGPTMessage(role: .user, content: "Hi, how are you?")])
        XCTAssertNoThrow(try result.get())
    }
}
