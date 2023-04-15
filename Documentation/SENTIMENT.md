# Sentyment Analysis

It allows you to understand the sentiment related to a text, and therefore to understand if it is positive, negative or neutral.
<br />
It can be thought of as a simple wrapper around the 'Completion' feature which performs a pre-set task, using optimized parameters.
<br />
Specifying the language used in the input text is not mandatory, in fact the model is able to understand it independently. However, in some cases specifying it speeds up response times and increases the quality of the output.

```swift
swiftyGPT.sentiment(text: "I loved the new Batman movie!", language: .english) { result in
    switch result {
    case .success(let response):
        print(response.rawValue)
    case .failure(let error):
        if let error = error as? SwiftyGPTError {
            print(error.message)
        } else {
            print(error.localizedDescription)
        }
    }
}
```

If successful, the method returns a **SwiftyGPTSentiment** object. That is an enum that exposes all possible cases.

## Async/Await

The feature is also available in Async/Await version.

```swift
let result: Result<SwiftyGPTSentiment, Error> = await swiftyGPT.sentiment(text: "I loved the new Batman movie!", language: .english)
```

