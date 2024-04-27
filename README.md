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
# Recommendations

To ensure security and flexibility, we recommend loading your OpenAI API key using environment variables instead of hardcoding it directly into your source code. This approach offers several advantages:
- **Security**: Storing sensitive information like API keys in environment variables helps prevent accidental exposure of credentials, reducing the risk of unauthorized access to your API resources.
- **Flexibility**: By using environment variables, you can easily switch between different API keys or update them without modifying your code. This flexibility is especially useful in development, testing, and deployment scenarios.
- **Best Practice**: Utilizing environment variables for configuration is considered a best practice in software development, promoting cleaner and more maintainable codebases.

Here's a simple example of how you can load your OpenAI API key from an environment variable in Swift:
```swift
guard let apiKey = ProcessInfo.processInfo.environment["OPENAI_API_KEY"] else {
    fatalError("Missing OpenAI API key. Please set the OPENAI_API_KEY environment variable.")
}
```

---
# Support the Project
Your generous donations help sustain and improve this project. Here's why supporting us is important:
1. **Covering API Costs**: Accessing certain features or services may require a paid API key. Your donations help cover the cost of maintaining these subscriptions, ensuring uninterrupted access to essential functionalities.
2. **Development and Maintenance**: Donations enable us to dedicate more time and resources to developing new features, fixing bugs, and maintaining the project's overall health. Your support directly contributes to the project's ongoing improvement and sustainability.
3. **Community Support**: Your contributions show your support for the project and help foster a thriving community around it. Your generosity motivates us to keep pushing the project forward and encourages others to join the cause.
4. **Open Source Sustainability**: By supporting open-source projects like ours, you're contributing to the sustainability of the entire open-source ecosystem. Your donations help ensure that valuable projects remain accessible to everyone.

Every donation, no matter how small, makes a big difference. Thank you for considering supporting us!<br><br>
<a href="https://www.buymeacoffee.com/antoniowar" target="_blank"><img src="https://github.com/appcraftstudio/buymeacoffee/raw/master/Images/snapshot-bmc-button.png" alt="Buy Me A Coffee" height="40"></a>

---
# Note
The content of this README.md file has been automatically generated using SwiftyGPT.

---
# License
SwiftyGPT is published under the MIT license.
