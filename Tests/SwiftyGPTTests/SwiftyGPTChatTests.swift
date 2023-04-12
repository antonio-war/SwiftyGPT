import XCTest
@testable import SwiftyGPT

final class SwiftyGPTChatTests: SwiftyGPTTestCase {
    
    func testDefaultCompletion() throws {
        let expectation = expectation(description: "DefaultChatCompletion")
        swiftyGPT.chat(messages: [SwiftyGPTChatMessage(role: .user, content: "Hi, how are you?")]) { result in
            switch result {
            case .success(let response):
                XCTAssertGreaterThanOrEqual(response.choices.count, 1)
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
    
    func testDefaultAsync() async {
        let result: Result<SwiftyGPTChatResponse, Error> = await swiftyGPT.chat(messages: [SwiftyGPTChatMessage(role: .user, content: "Hi, how are you?")])
        switch result {
        case .success(let response):
            XCTAssertGreaterThanOrEqual(response.choices.count, 1)
        case .failure(let error):
            if let error = error as? SwiftyGPTError {
                XCTFail(error.message)
            } else {
                XCTFail(error.localizedDescription)
            }
        }
    }
    
    func testSingleMessageCompletion() {
        let expectation = expectation(description: "SingleMessageCompletion")
        swiftyGPT.chat(message: SwiftyGPTChatMessage(role: .user, content: "Hi, how are you?")) { result in
            switch result {
            case .success(let response):
                XCTAssertEqual(response.choices.count, 1)
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
    
    func testSingleMessageAsync() async {
        let result: Result<SwiftyGPTChatResponse, Error> = await swiftyGPT.chat(message: SwiftyGPTChatMessage(role: .user, content: "Hi, how are you?"))
        switch result {
        case .success(let response):
            XCTAssertEqual(response.choices.count, 1)
        case .failure(let error):
            if let error = error as? SwiftyGPTError {
                XCTFail(error.message)
            } else {
                XCTFail(error.localizedDescription)
            }
        }
    }
    
    func testStringCompletion() {
        let expectation = expectation(description: "StringCompletion")
        swiftyGPT.chat(messages: ["Hi how are you ?", "I'm SwiftyGPT"]) { result in
            switch result {
            case .success(let response):
                XCTAssertNotEqual(response, "")
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
    
    func testStringAsync() async {
        let result: Result<String, Error> = await swiftyGPT.chat(messages: ["Hi how are you ?", "I'm SwiftyGPT"])
        switch result {
        case .success(let response):
            XCTAssertNotEqual(response, "")
        case .failure(let error):
            if let error = error as? SwiftyGPTError {
                XCTFail(error.message)
            } else {
                XCTFail(error.localizedDescription)
            }
        }
    }
    
    func testSingleStringCompletion() {
        let expectation = expectation(description: "SingleStringCompletion")
        swiftyGPT.chat(message: "Hi how are you ?") { result in
            switch result {
            case .success(let response):
                XCTAssertNotEqual(response, "")
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
    
    func testSingleStringAsync() async {
        let result: Result<String, Error> = await swiftyGPT.chat(message: "Hi how are you ?")
        switch result {
        case .success(let response):
            XCTAssertNotEqual(response, "")
        case .failure(let error):
            if let error = error as? SwiftyGPTError {
                XCTFail(error.message)
            } else {
                XCTFail(error.localizedDescription)
            }
        }
    }
}
