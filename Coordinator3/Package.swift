// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Coordinator3",
	platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "Coordinator3",
            targets: ["Coordinator3"]
		),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Coordinator3",
            dependencies: []
		),
        .testTarget(
            name: "Coordinator3Tests",
            dependencies: ["Coordinator3"]
		),
    ]
)
