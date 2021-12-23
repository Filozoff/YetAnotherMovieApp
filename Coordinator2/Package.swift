// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Coordinator2",
	platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "Coordinator2",
            targets: ["Coordinator2"]
		),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Coordinator2",
            dependencies: []
		),
        .testTarget(
            name: "Coordinator2Tests",
            dependencies: ["Coordinator2"]
		),
    ]
)
