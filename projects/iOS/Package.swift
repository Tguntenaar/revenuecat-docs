// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "iOS",
    platforms: [
        .macOS(.v10_13),
        .watchOS("6.2"),
        .tvOS(.v11),
        .iOS(.v11)
    ],
    dependencies: [
        .package(name: "RevenueCat", url: "https://github.com/revenuecat/purchases-ios", from: "4.15.0")
    ],
    targets: [
        .executableTarget(
            name: "iOS",
            dependencies: ["RevenueCat"]),
        .testTarget(
            name: "iOSTests",
            dependencies: ["iOS"]),
    ]
)