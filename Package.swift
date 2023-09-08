// swift-tools-version:5.2


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
