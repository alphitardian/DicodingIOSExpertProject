// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Favorite",
    platforms: [.iOS(.v15), .macOS(.v10_15)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Favorite",
            targets: ["Favorite"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(name: "Realm", url: "https://github.com/realm/realm-cocoa.git", from: "5.5.2"),
        .package(name: "Core", url: "https://github.com/alphitardian/DicodingIOSExpertProject-Core-Package.git", from: "1.0.0"),
        .package(path: "../Browse")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Favorite",
            dependencies: ["Core", "Browse", "Realm"]),
        .testTarget(
            name: "FavoriteTests",
            dependencies: ["Favorite"]),
    ]
)
