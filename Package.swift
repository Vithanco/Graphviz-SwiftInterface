// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

#if os(Windows)
let systemLibraries: [Target] = [
    .systemLibrary(
        name: "Clibgraphviz"
    )
]
#else
let systemLibraries: [Target] = [
    .systemLibrary(
        name: "Clibgraphviz",
        pkgConfig: "libcgraph",
        providers: [
          .brew(["graphviz"]),
          .apt(["graphviz-dev"]),
        ]
    ),
]
#endif

let package = Package(
    name: "Graphviz-SwiftInterface",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "Graphviz-SwiftInterface",
            targets: ["Graphviz-SwiftInterface"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: systemLibraries + [
        .target(
            name: "Graphviz-SwiftInterface",
            dependencies: ["Clibgraphviz"]),
        .testTarget(
            name: "GraphVizTests",
            dependencies: ["Graphviz-SwiftInterface"]),
    ]
)
