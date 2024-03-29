// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Features",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "API",
            targets: ["API"]
        ),
        .library(
            name: "Features",
            targets: ["Features"]
        ),
        .library(
            name: "Settings",
            targets: ["Settings"]
        ),
        .library(
            name: "Today",
            targets: ["Today"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture.git", from: "1.7.0"),
    ],
    targets: [
        .target(
            name: "API",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
            ]
        ),
        .testTarget(
            name: "APITests",
            dependencies: ["API"]
        ),
        .target(
            name: "Features",
            dependencies: [
                "Settings",
                "Today",
            ]
        ),
        .testTarget(
            name: "FeaturesTests",
            dependencies: ["Features"]
        ),
        .target(
            name: "Settings",
            dependencies: []
        ),
        .testTarget(
            name: "SettingsTests",
            dependencies: ["Settings"]
        ),
        .target(
            name: "Today",
            dependencies: ["API"]
        ),
        .testTarget(
            name: "TodayTests",
            dependencies: ["Today"]
        ),
    ]
)
