<p align="center">
<img width="1042" src="https://user-images.githubusercontent.com/59933379/228211801-2646ac50-4bbf-4b4c-88b9-366bad8d76cf.png">
</p>

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fantonio-war%2FSwiftyGPT%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/antonio-war/SwiftyGPT)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fantonio-war%2FSwiftyGPT%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/antonio-war/SwiftyGPT)

**SwiftyGPT** is an unofficial, lightweight and user-friendly Swift wrapper for accessing [OpenAI API](https://platform.openai.com/docs/api-reference).
- **Simple**: Designed with simplicity and ease of use in mind, SwiftyGPT eliminates the need for extensive configuration, making it ready to use right out of the box, all you need is your API Key! Say goodbye to cumbersome coding and hello to effortless interaction with OpenAI's capabilities!
- **Customizable**: Whether you want to fine-tune parameters like model selection, adjust temperature, or rely on default values, SwiftyGPT offers flexibility to suit your needs.
- **Modular**: SwiftyGPT is divided into modules, utilizing a different target for each feature exposed by the API. Import only the code that you really need, keeping your project lightweight and efficient.
- **Mockable**: SwiftyGPT employs protocol-oriented programming to guarantee testability and maintainability. It already exposes some mock objects that can be seamlessly utilized in testing or SwiftUI previews, eliminating the need for actual API calls. 

---
# Integration
Integrating SwiftyGPT into your Swift project is straightforward. Follow these steps to get started:

1. **Install SwiftyGPT**:
   - If you're using Swift Package Manager (SPM):
     - Open your Xcode project.
     - Navigate to "File" > "Swift Packages" > "Add Package Dependency...".
     - Enter the SwiftyGPT repository URL: `https://github.com/antonio-war/SwiftyGPT`.
     - Follow the prompts to select the version and add SwiftyGPT to your project.
     - SwiftyGPT exposes multiple targets, import only the ones that you really need in your project.
   - If you're using CocoaPods or Carthage, we're sorry, but they are not currently supported.
2. **Import SwiftyGPT**:
   - In the files where you want to use SwiftyGPT features, import its modules at the top of the file:
     ```swift
     import SwiftyGPTChat
     ```
3. **Start Using SwiftyGPT**:
   - Once SwiftyGPT is imported, you can start using its APIs to interact with GPT models.
   - Refer to the documentation for guidance on how to use its features for text generation, conversation, summarization, and more.
5. **Run Your Project**:
   - Build and run your project to ensure that SwiftyGPT has been integrated successfully.
   - Test out the functionality you've implemented using SwiftyGPT to ensure everything works as expected.
That's it! You've successfully integrated SwiftyGPT into your project and can now leverage its powerful features.

---
# Exploration
Uncover the limitless possibilities of SwiftGPT as you embark on a journey of discovery through the innovative [Explorer](https://github.com/antonio-war/SwiftyGPT/tree/develop/Explorer) app.<br>
Delve deep into the realm of natural language processing and unleash the full potential of SwiftGPT with these captivating features:
- **Discover the Full Potential**: Immerse yourself in the boundless capabilities of SwiftGPT as you navigate through the intuitive interface of the Explorer app. Unveil the power of state-of-the-art GPT models and witness firsthand their transformative impact on text generation, conversation, summarization, and more.
- **Explore Popular Use Cases**: Embark on an exploration of the most popular use cases for SwiftGPT, meticulously curated within the Explorer app. From crafting compelling narratives to engaging in dynamic conversational interactions, delve into a myriad of scenarios where SwiftGPT shines brightest.
- **Practical Examples for Seamless Integration**: Seamlessly integrate SwiftGPT into your projects with practical examples and step-by-step guidance provided by the Explorer app. Unlock the secrets to effortless integration and harness the unparalleled versatility of SwiftGPT to elevate your applications to new heights of excellence.

---
# Recommendation

To ensure security and flexibility, we recommend loading your OpenAI API key using environment variables instead of hardcoding it directly into your source code. This approach offers several advantages:
- **Security**: Storing sensitive information like API keys in environment variables helps prevent accidental exposure of credentials, reducing the risk of unauthorized access to your API resources.
- **Flexibility**: By using environment variables, you can easily switch between different API keys or update them without modifying your code. This flexibility is especially useful in development, testing, and deployment scenarios.
- **Best Practice**: Utilizing environment variables for configuration is considered a best practice in software development, promoting cleaner and more maintainable codebases.

Here's a simple example of how you can load your OpenAI API key from an environment variable in Swift:
```swift
guard let apiKey = ProcessInfo.processInfo.environment["OPEN_AI_API_KEY"] else {
    fatalError("Missing OpenAI API key. Please set the OPEN_AI_API_KEY environment variable.")
}
```

---
# Support
Your generous donations help sustain and improve this project. Here's why supporting us is important:
1. **Covering API Costs**: Accessing certain features or services may require a paid API key. Your donations help cover the cost of maintaining these subscriptions, ensuring uninterrupted access to essential functionalities.
2. **Development and Maintenance**: Donations enable us to dedicate more time and resources to developing new features, fixing bugs, and maintaining the project's overall health. Your support directly contributes to the project's ongoing improvement and sustainability.
3. **Community Support**: Your contributions show your support for the project and help foster a thriving community around it. Your generosity motivates us to keep pushing the project forward and encourages others to join the cause.
4. **Open Source Sustainability**: By supporting open-source projects like ours, you're contributing to the sustainability of the entire open-source ecosystem. Your donations help ensure that valuable projects remain accessible to everyone.

Every donation, no matter how small, makes a big difference. Thank you for considering supporting us!<br><br>
<a href="https://www.buymeacoffee.com/antoniowar" target="_blank"><img src="https://github.com/appcraftstudio/buymeacoffee/raw/master/Images/snapshot-bmc-button.png" alt="Buy Me A Coffee" height="40"></a>

---
# Note
The content of this file has been automatically generated using SwiftyGPT.

---
# License
SwiftyGPT is published under the MIT license.
