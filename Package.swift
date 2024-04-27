// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftyGPT",
    platforms: [
        .macOS(.v13),
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "SwiftyGPTChat",
            targets: [
                "SwiftyGPTChat",
            ]
        ),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "SwiftyGPTChat",
            dependencies: [
                "SwiftyGPTNetworking"
            ]
        ),
        .testTarget(
            name: "SwiftyGPTChatTests",
            dependencies: [
                "SwiftyGPTChat"
            ]
        ),
        .target(
            name: "SwiftyGPTNetworking",
            dependencies: [
            ]
        ),
        .testTarget(
            name: "SwiftyGPTNetworkingTests",
            dependencies: [
                "SwiftyGPTNetworking"
            ]
        )
    ]
)
