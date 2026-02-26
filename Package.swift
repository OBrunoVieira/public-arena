// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "public-arena",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "public-arena",
            targets: ["CommentSystemTarget"]
        ),
    ],
    dependencies: [
        // KMAuth depends on GoogleSignIn natives
        .package(url: "https://github.com/google/GoogleSignIn-iOS", "7.0.0"..<"10.0.0")
    ],
    targets: [
        .binaryTarget(
            name: "commentsystem",
            url: "https://github.com/OBrunoVieira/public-arena/releases/download/1.0.1-alpha06/commentsystem.xcframework.zip",
            checksum: "a3640028ca409fed4dd66e00e2f327d083b0fda466c50f1b50415753c57d1559"
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
