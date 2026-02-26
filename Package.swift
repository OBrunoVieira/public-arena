// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "CommentSystemSDK",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "CommentSystemSDK",
            targets: ["CommentSystemTarget"]
        ),
    ],
    dependencies: [
        // KMAuth depends on GoogleSignIn natives
        .package(url: "https://github.com/google/GoogleSignIn-iOS", from: "7.0.0")
    ],
    targets: [
        .binaryTarget(
            name: "commentsystem",
            url: "https://github.com/OBrunoVieira/public-arena/releases/download/1.0.1-alpha06/commentsystem.xcframework.zip",
            checksum: "5a6e544e07fdaa29b0f13ebad953f5cae2a2231108ee4c914923970714e711ba"
        ),
        .target(
            name: "CommentSystemTarget",
            dependencies: [
                .target(name: "commentsystem"),
                .product(name: "GoogleSignIn", package: "GoogleSignIn-iOS")
            ]
        )
    ]
)
