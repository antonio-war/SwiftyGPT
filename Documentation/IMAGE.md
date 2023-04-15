# Image

SwiftyGPT uses DALL-E to generate images from textual descriptions. You can describe an object or a scene in words, and SwiftyGPT can create a corresponding image of it.

## Single Generation

The easiest way to generate an image is to use the following method, that accept a prompt and a size. It has the limitation of generating only square images of the following sizes: 256x256, 512x512 and 1024x1024. Also in this case if necessary you can specify a user for each call.

```swift
swiftyGPT.image(prompt: "Draw an unicorn", size: .x256) { result in
    switch result {
    case .success(let image):
        print(image)
    case .failure(let error):
        if let error = error as? SwiftyGPTError {
            print(error.message)
        } else {
            print(error.localizedDescription)
        }
    }
}
```
If successful, the method returns an UIImage that you can use directly in UIKit or wrap with an Image if you use SwiftUI.

## Multiple Generation

In case you want to generate several different images starting from the same description, you can specify the choices parameter. In this case the method will return an array of Data.

```swift
swiftyGPT.image(prompt: "Draw an unicorn", choices: 2, size: .x256) { result in
    switch result {
    case .success(let images):
        print(images)
    case .failure(let error):
        if let error = error as? SwiftyGPTError {
            print(error.message)
        } else {
            print(error.localizedDescription)
        }
    }
}
```

## Async/Await

All methods of the image feature are also available in Async/Await version.

```swift
let result: Result<UIImage, Error> = await swiftyGPT.image(prompt: "Draw an unicorn", size: .x256)
```
