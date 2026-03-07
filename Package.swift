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
        .package(url: "https://github.com/google/GoogleSignIn-iOS.git", from: "7.1.0"),
        .package(url: "https://github.com/firebase/firebase-ios-sdk.git", from: "11.0.0")
    ],
    targets: [
        .binaryTarget(
            name: "commentsystem",
            url: "https://github.com/OBrunoVieira/public-arena/releases/download/1.0.1-alpha066/commentsystem.xcframework.zip",
            checksum: "16b795566eefd836003b0b8e9a1ac05d2399df1c1942ce750bc840016fa223db"
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
