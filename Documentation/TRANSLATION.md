# Language Translation

This feature allows you to translate a text in another language, choosing from all those supported by SwiftyGPT..
<br />
It can be thought of as a simple wrapper around the 'Completion' feature which performs a pre-set task, using optimized parameters.
<br />
Specifying the language used in the input text is not mandatory, in fact the model is able to understand it independently. However, in some cases specifying it speeds up response times and increases the quality of the output.

```swift
swiftyGPT.translation(text: "Hi, how are you ?", from: .english, to: .italian) { result in
    switch result {
    case .success(let response):
        print(response)
    case .failure(let error):
        if let error = error as? SwiftyGPTError {
            print(error.message)
        } else {
            print(error.localizedDescription)
        }
    }
    expectation.fulfill()
}
```

If successful, the method returns the correct text directly in string format.

## Async/Await

The feature is also available in Async/Await version.

```swift
let result: Result<String, Error> = await swiftyGPT.translation(text: "Hello", from: .english, to: .italian)
```
