// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "autosavePackage",
    products: [
        .library(
            name: "Core",
            targets: ["Core"])
        
        ],
    dependencies: [],
    targets: [
        .target(
            name: "Core",
            dependencies: [],
            path: "Sources/Core")
        
        ]
)

