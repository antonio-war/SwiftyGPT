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
            name: "SwiftyGPT",
            targets: ["SwiftyGPT"]
        ),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "SwiftyGPT",
            dependencies: [
            ]
        ),
        .testTarget(
            name: "SwiftyGPTTests",
            dependencies: [
                "SwiftyGPT"
            ]
        )
    ]
)
