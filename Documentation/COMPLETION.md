# Completion

SwiftyGPT also provides methods for creating completions using models like Davinci or Babbage. Given a prompt, the model will return one or more predicted completions based on the 'choices' parameters which you have already seen before.
<br />
<br />
Also in this case it is obviously possible to set some parameters in such a way as to best condition our response.

```swift
swiftyGPT.completion(prompt: "Say \"Hello\" in italian", model: .text_davinci_003) { result in
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

In case of success methods return a SwiftyGPTCompletionResponse object which is the entire transcript of HTTP response.
To get the concrete response text you have to check the content of the 'choices' attribute.

```swift
let text = response.choices.first?.text
```

## Async/Await

All methods of the completion feature are also available in Async/Await version.

```swift
let result: Result<SwiftyGPTCompletionResponse, Error> = await swiftyGPT.completion(prompt: "Say \"Hello\" in italian")
```
