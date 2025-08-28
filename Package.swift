// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AEOTPTextField",
    platforms: [.iOS(.v12)],
    products: [
        .library(
            name: "AEOTPTextField",
            targets: ["AEOTPTextField"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "AEOTPTextField",
            dependencies: [],
            path: "AEOTPTextField/Source"),
        .testTarget(
            name: "AEOTPTextFieldTests",
            dependencies: [
                "AEOTPTextField",
            ],
            path: "AEOTPTextFieldTests")
    ])
