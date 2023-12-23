// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CodiFramework",
    platforms: [
        .iOS(.v15), // Set minimum platform to iOS 13
        // include other platforms if needed
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Codi",
            targets: ["Codi"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on. github.com/firebase/firebase-ios-sdk.git
        .package(url: "https://github.com/realm/realm-cocoa.git", branch: "master"),
        .package(url: "https://github.com/firebase/firebase-ios-sdk.git", from: "10.18.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Codi",
            dependencies: [
                .product(name: "RealmSwift", package: "realm-cocoa"),
                .product(name: "FirebaseDatabase", package: "firebase-ios-sdk")
            ]),
    ]
)
