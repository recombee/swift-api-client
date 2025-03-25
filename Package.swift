// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "RecombeeClient",
    platforms: [
        .iOS(.v14),
        .tvOS(.v14),
        .macOS(.v11),
        .watchOS(.v7),
    ],
    products: [
        .library(
            name: "RecombeeClient",
            targets: ["RecombeeClient"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/Flight-School/AnyCodable.git", from: "0.6.7"),
    ],
    targets: [
        .target(
            name: "RecombeeClient",
            dependencies: ["AnyCodable"],
            path: "Sources"
        ),
        .testTarget(
            name: "RecombeeClientTests",
            dependencies: ["RecombeeClient"],
            path: "Tests"
        ),
    ]
)
