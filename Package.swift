// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "public-arena",
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
        .package(url: "https://github.com/google/GoogleSignIn-iOS", "7.0.0"..<"10.0.0")
    ],
    targets: [
        .binaryTarget(
            name: "commentsystem",
            url: "https://github.com/OBrunoVieira/public-arena/releases/download/1.0.1-alpha063/commentsystem.xcframework.zip",
            checksum: "cc201f615f78a8b376238dccdd7678e7b2f8f04ee43d73ed60c9af8b95c517c3"
        ),
        .target(
            name: "CommentSystemTarget",
            dependencies: [
                .target(name: "commentsystem"),
                .product(name: "GoogleSignIn", package: "GoogleSignIn-iOS")
            ],
            linkerSettings: [
                .unsafeFlags(["-ObjC"])
            ]
        )
    ]
)
