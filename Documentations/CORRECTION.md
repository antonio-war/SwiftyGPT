# Grammar Correction

This feature allows you to make grammar corrections in a text written in one of the supported languages.
<br />
It can be thought of as a simple wrapper around the 'Completion' feature which performs a pre-set task, using optimized parameters.
<br />
Specifying the language used in the text is not mandatory, in fact the model is able to understand it independently. However, in some cases specifying it speeds up response times and increases the quality of the output.

```swift
swiftyGPT.correction(text: "She no went to the market", language: .english) { result in
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
}
```

If successful, the method returns the correct text directly in string format.

## Async/Await

The feature is also available in Async/Await version.

```swift
let result: Result<String, Error> = await swiftyGPT.correction(text: "She no went to the market", language: .english)
```
