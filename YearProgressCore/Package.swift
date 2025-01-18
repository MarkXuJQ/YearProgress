// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "YearProgressCore",
    platforms: [.macOS(.v13)],
    products: [
        .library(
            name: "YearProgressCore",
            targets: ["YearProgressCore"]),
    ],
    targets: [
        .target(
            name: "YearProgressCore",
            dependencies: []),
        .testTarget(
            name: "YearProgressCoreTests",
            dependencies: ["YearProgressCore"]),
    ]
) 