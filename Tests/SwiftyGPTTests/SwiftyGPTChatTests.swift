import XCTest
@testable import SwiftyGPT

final class SwiftyGPTChatTests: XCTestCase, SwiftyGPTSecureTest {
    private var swiftyGPT: SwiftyGPT!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        swiftyGPT = SwiftyGPT(apiKey: try apiKey)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        swiftyGPT = nil
    }
    
    func testDefaultCompletion() {
        let expectation = expectation(description: "DefaultChatCompletion")
        var result: Result<SwiftyGPTChatResponse, Error>? = nil
        swiftyGPT.chat(messages: [SwiftyGPTChatMessage(role: .user, content: "Hi, how are you?")]) { response in
            result = response
            expectation.fulfill()
        }
        waitForExpectations(timeout: 30, handler: nil)
        
        XCTAssertNotNil(result)
        XCTAssertNoThrow(try result?.get())
    }
    
    func testDefaultAsync() async {
        let result: Result<SwiftyGPTChatResponse, Error> = await swiftyGPT.chat(messages: [SwiftyGPTChatMessage(role: .user, content: "Hi, how are you?")])
        XCTAssertNoThrow(try result.get())
    }
    
    func testSingleMessageCompletion() {
        let expectation = expectation(description: "SingleMessageCompletion")
        var result: Result<SwiftyGPTChatResponse, Error>? = nil
        swiftyGPT.chat(message: SwiftyGPTChatMessage(role: .user, content: "Hi, how are you?")) { response in
            result = response
            expectation.fulfill()
        }
        waitForExpectations(timeout: 30, handler: nil)
        
        XCTAssertNotNil(result)
        XCTAssertNoThrow(try result?.get())
    }
    
    func testSingleMessageAsync() async {
        let result: Result<SwiftyGPTChatResponse, Error> = await swiftyGPT.chat(message: SwiftyGPTChatMessage(role: .user, content: "Hi, how are you?"))
        XCTAssertNoThrow(try result.get())
    }
    
    func testStringCompletion() {
        let expectation = expectation(description: "StringCompletion")
        var result: Result<String, Error>? = nil
        swiftyGPT.chat(messages: ["Hi how are you ?", "I'm SwiftyGPT"]) { response in
            result = response
            expectation.fulfill()
        }
        waitForExpectations(timeout: 30, handler: nil)
        
        XCTAssertNotNil(result)
        XCTAssertNoThrow(try result?.get())
    }
    
    func testStringAsync() async {
        let result: Result<String, Error> = await swiftyGPT.chat(messages: ["Hi how are you ?", "I'm SwiftyGPT"])
        XCTAssertNoThrow(try result.get())
    }
    
    func testSingleStringCompletion() {
        let expectation = expectation(description: "SingleStringCompletion")
        var result: Result<String, Error>? = nil
        swiftyGPT.chat(message: "Hi how are you ?") { response in
            result = response
            expectation.fulfill()
        }
        waitForExpectations(timeout: 30, handler: nil)
        
        XCTAssertNotNil(result)
        XCTAssertNoThrow(try result?.get())
    }
    
    func testSingleStringAsync() async {
        let result: Result<String, Error> = await swiftyGPT.chat(message: "Hi how are you ?")
        XCTAssertNoThrow(try result.get())
    }
}
