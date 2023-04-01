// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftyGPT",
    platforms: [.macOS(.v13), .iOS(.v13)],
    products: [
        .library(
            name: "SwiftyGPT",
            targets: ["SwiftyGPT"]),
    ],
    dependencies: [
        .package(url: "https://github.com/antonio-war/SwiftyHTTP", from: "0.1.5"),
        .package(url: "https://github.com/antonio-war/SwiftyRanged", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "SwiftyGPT",
            dependencies: ["SwiftyHTTP", "SwiftyRanged"]),
        .testTarget(
            name: "SwiftyGPTTests",
            dependencies: ["SwiftyGPT", "SwiftyHTTP"],
            resources: [
                .copy("OpenAI-Info.plist")
            ])
    ]
)
