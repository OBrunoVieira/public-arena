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
        .package(url: "https://github.com/google/GoogleSignIn-iOS", "7.0.0"..<"10.0.0"),
        .package(url: "https://github.com/firebase/firebase-ios-sdk", from: "10.0.0")
    ],
    targets: [
        .binaryTarget(
            name: "commentsystem",
            url: "https://github.com/OBrunoVieira/public-arena/releases/download/1.0.1-alpha064/commentsystem.xcframework.zip",
            checksum: "b783ee116d4a3fd8e242156bf45912117b98106e41f1fa6ca497f34f8ad1f438"
        ),
        .target(
            name: "CommentSystemTarget",
            dependencies: [
                .target(name: "commentsystem"),
                .product(name: "GoogleSignIn", package: "GoogleSignIn-iOS"),
                .product(name: "FirebaseAuth", package: "firebase-ios-sdk"),
                .product(name: "FirebaseCore", package: "firebase-ios-sdk")
            ],
            linkerSettings: [
                .linkedLibrary("c++"),
                .unsafeFlags(["-ObjC", "-all_load"])
            ]
        )
    ]
)
