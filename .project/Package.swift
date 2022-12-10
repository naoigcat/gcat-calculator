// swift-tools-version:5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

public let package = Package(
    name: "Package",
    platforms: [.iOS(.v15)],
    dependencies: [
        .package(url: "https://github.com/realm/SwiftLint.git", "0.49.0"..<"0.50.0"),
    ],
    targets: [
        .target(
            name: "Package",
            path: "Sources"
        ),
    ]
)
