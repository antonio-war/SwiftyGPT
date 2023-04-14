# Chat

Chat is the main feature of SwiftyGPT, as you can guess it allows you to ask ChatGPT for something. There are several method that you can use to reach the same goal.

## Deep Version

Deep versions allow you maximum over request creation. The main element of a request is a SwiftyGPTChatMessage.

```swift
let message = SwiftyGPTChatMessage(role: .user, content: "Hi, how are you?")
```

You can use role to instruct the model precisely as explained by the ChatGPT documentation and get the control you want.

```swift
swiftyGPT.chat(message: message) { result in
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
Alternatively if you need to send multiple messages in one request you can use the multiple input method.

```swift
swiftyGPT.chat(messages: messages) { result in
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
In both method you can specify some optional parameters like model, temperature, maxTokens and others established by OpenAI. 

```swift
swiftyGPT.chat(message: SwiftyGPTChatMessage(role: .user, content: "Hi, how are you?"), temperature: 5, user: "Test")  { result in
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

In case of success methods return a SwiftyGPTChatResponse object which is the entire transcript of ChatGPT HTTP response.
To access the received message or messages you have to check the content of the 'choices' attribute. By default choices array size is one, so you can get the message in this way and read its content or other attributes.

```swift
let message = response.choices.first?.message
```

However, if you have requested a different number of choices, the array will have a larger size and you will have to manage the response in a custom way.


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
            if let error = error as? SwiftyGPTError {
                print(error.message)
            } else {
                print(error.localizedDescription)
            }
    }    
}
```
In this case the method directly returns the message of the single choice in string format.

## Async/Await

All methods of the chat feature are also available in Async/Await version.

```swift
let result: Result<String, Error> = await swiftyGPT.chat(message: "Hi how are you ?")
```
