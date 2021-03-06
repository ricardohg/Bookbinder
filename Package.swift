// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Bookbinder",
    
    platforms: [
        .macOS(.v10_12),
        .iOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Bookbinder",
            targets: ["Bookbinder"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/weichsel/ZIPFoundation.git", .upToNextMajor(from: "0.9.0")),
        .package(url: "https://github.com/tid-kijyun/Kanna.git", from: "5.0.0")
        
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Bookbinder",
            dependencies: ["ZIPFoundation", "Kanna"],
            path: "Bookbinder",
            exclude: ["Info.plist"])
        ,
        .testTarget(
            name: "BookbinderTests",
            dependencies: ["Bookbinder"],
            path: "BookbinderTests",
            exclude: ["Info.plist"],
            resources: [.copy("EPUBs"), .copy("OPFs"), .copy("NCXs"), .copy("ZIPs"), .copy("Containers")])
        
    ],
    swiftLanguageVersions: [.v5]
)
