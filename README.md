# SwiftyGPT

SwiftyGPT is a simple and lightweight wrapper around OpenAI API.
It was born with the aim of provide a Swift like interface around all OpenAI capabilities, so you can make requestes and get responses with minimal coding effort.

- **Easy to use:** no configuration needed, SwiftyGPT is ready to go, you just need an API Key.
- **Configurable:** you can choose some parameters like model, temperature, tokens or just use default values.
- **SwiftUI compatible:** provides an elegant SwiftUI support that is very easy to use.

---

# Installation

You can use Swift Package Manager to add SwiftyGPT to your project.

## Add Package Dependency

In Xcode, select File > Add Packages...

## Specify the Repository

Copy and paste the following into the search/input box.

https://github.com/antonio-war/SwiftyGPT

## Specify options

Use **Up to Next Major Version** as dependency rule and enter the current SwiftyGPT version.
Then click **Add Package**.

---

# Overview

## Setting Up

The first thing you need to do is to create a SwiftyGPT instance.

```swift
let swiftyGPT = SwiftyGPT(apiKey: "YOUR_API_KEY")
```

## Chat

Once you have created an instance you can use it to start a chat with ChatGPT.
You need to create an array of SwiftyGPTMessage.

```swift
let messages = [SwiftyGPTMessage(role: .user, content: "Hi, how are you?")]
```
You can use the role to instruct the model precisely as explained by the ChatGPT documentation. Or use a simpler constructor that uses 'user' as default role.

```swift
let messages = [SwiftyGPTMessage(content: "Hi, how are you?")]
```

Once the message array is created you can use it to make a request through the chat method.

```swift
swiftyGPT.chat(messages: messages) { result in
    switch result {
        case .success(let response):
            print(response)
        case .failure(let error):
            print(error)
    }
}
```

The same method is also available in Async/Await version.

### Response Handling

Chat method in success case return a SwiftyGPTResponse object which is the entire transcript of ChatGPT HTTP response.
To access the received message or messages you have to check the content of the 'choices' attribute. By default choices array size is one, so you can get the message in this way and read its content or other attributes.

```swift
let message = response.choices.first?.message
```

However, if you have requested a different number of choices, the array will have a larger size and you will have to manage the response in a custom way.

## SwiftUI

SwiftyGPT was born with the idea of integrating perfectly with SwiftUI, that's why a SwiftyGPT object is an ObservableObject that exposes some published variable like :

```swift
@Published var conversation: [SwiftyGPTMessage]
```
That enable you to trace all current session messages and update your UI.

---
# License
SwiftyCache is published under the Apache 2.0 license.
