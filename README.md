<p align="center">
<img width="1042" src="https://user-images.githubusercontent.com/59933379/228211801-2646ac50-4bbf-4b4c-88b9-366bad8d76cf.png">
</p>

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fantonio-war%2FSwiftyGPT%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/antonio-war/SwiftyGPT)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fantonio-war%2FSwiftyGPT%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/antonio-war/SwiftyGPT)

SwiftyGPT is a simple and lightweight wrapper around OpenAI API.
It was born with the aim of provide a Swift like interface around all OpenAI capabilities, so you can make requestes and get responses with minimal coding effort.

- **Easy to use:** no configuration needed, SwiftyGPT is ready to go, you just need an API Key.
- **Configurable:** you can choose some parameters like model, temperature or just use default values.
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

# Setting Up

The first thing you need to do is to create a SwiftyGPT instance.

```swift
let swiftyGPT = SwiftyGPT(apiKey: "YOUR_API_KEY")
```

---

# Chat

Chat is the main feature of SwiftyGPT, as you can guess it allows you to ask ChatGPT for something. There are several method that you can use to reach the same goal.

## Deep Version

Deep versions allow you maximum over request creation. The main element of a request is a SwiftyGPTMessage.

```swift
let message = SwiftyGPTMessage(role: .user, content: "Hi, how are you?")
```

You can use role to instruct the model precisely as explained by the ChatGPT documentation and get the control you want.

```swift
swiftyGPT.chat(message: message) { result in
    switch result {
        case .success(let response):
            print(response)
        case .failure(let error):
            print(error)
    }
}
```
Alternatively if you need to send multiple messages in one request you can use the multiple input method.

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
In both method you can specify some optional parameters like model, temperature, maxTokens and others established by OpenAI. 

```swift
swiftyGPT.chat(message: SwiftyGPTMessage(role: .user, content: "Hi, how are you?"), temperature: 5, user: "Test")  { result in
    switch result {
        case .success(let response):
            print(response)
        case .failure(let error):
            print(error)
    }
}
```

## High Version

If you don't need a lot of control on your requests you can use High Versions methods that works with simple Strings. Obviously this brings some limitations :

- **Role:** all messages are sent using the 'user' role, you can't send messages as 'system'.
- **Parameters:** these methods allow you to specify only the model to use and, if necessary, a user.
- **Single Choice:** each request corresponds to a single response message.

```swift
swiftyGPT.chat(message: "Hi how are you ?") { response in
    switch result {
        case .success(let response):
            print(response)
        case .failure(let error):
            print(error)
    }    
}
```

## Async/Await

All methods of the chat feature are also available in Async/Await version.

```swift
let result: Result<String, Error> = await swiftyGPT.chat(message: "Hi how are you ?")
```

## Response Handling

In case you use high level methods the response will be directly in string format.
In Deep case instead methods return a SwiftyGPTResponse object which is the entire transcript of ChatGPT HTTP response.
To access the received message or messages you have to check the content of the 'choices' attribute. By default choices array size is one, so you can get the message in this way and read its content or other attributes.

```swift
let message = response.choices.first?.message
```

However, if you have requested a different number of choices, the array will have a larger size and you will have to manage the response in a custom way.

## Error Handling

In case of failure the methods return an error, it can be a system error in case something went wrong on the iOS side. For example, network-level issues. If instead the error is related to ChatGPT you will get a SwiftyGPTError.

```swift
if let error = error as? SwiftyGPTError {
    print(error.message)
}
```
---
# License
SwiftyGPT is published under the Apache 2.0 license.
