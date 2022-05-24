// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import Foundation
import PackageDescription

func getFilesRecursively(in dirs: [String]) -> [String] {
    dirs.reduce([String]()) { ret, dir in
        var ret = ret
        ret.append(contentsOf: getFilesRecursively(in: dir))
        return ret
    }
}

func getFilesRecursively(in dir: String) -> [String] {
    let items = try! FileManager.default.contentsOfDirectory(atPath: dir)
    
    let directories = items.filter { item in
        var isDirectory = ObjCBool(false)
        FileManager.default.fileExists(atPath: item, isDirectory: &isDirectory)
        return isDirectory.boolValue
    }
    var files = items.filter { directories.contains($0) }
    directories.forEach { files.append(contentsOf: getFilesRecursively(in: $0)) }
    print(files)
    return files
}

func getSourceFiles(in dirs: [String]) -> [String] {
    let sourceExtenstions = [
        "cpp",
        "c",
        "mm",
    ]
    let sourceFiles = getFilesRecursively(in: dirs).filter { sourceExtenstions.contains(URL(fileURLWithPath: $0).pathExtension)}
    print(sourceFiles)
    return sourceFiles
}

let bimgExcludes: [String] = [
    "3rdparty/libsquish/README",
    "3rdparty/libsquish/LICENSE",

    "3rdparty/astc-codec/src/base/test/bit_stream_test.cpp",
    "3rdparty/astc-codec/src/base/test/bottom_n_test.cpp",
    "3rdparty/astc-codec/src/base/test/math_utils_test.cpp",
    "3rdparty/astc-codec/src/base/test/optional_test.cpp",
    "3rdparty/astc-codec/src/base/test/string_utils_test.cpp",
    "3rdparty/astc-codec/src/base/test/type_traits_test.cpp",
    "3rdparty/astc-codec/src/base/test/uint128_test.cpp",
    "3rdparty/astc-codec/src/base/BUILD.bazel",
    "3rdparty/astc-codec/src/base/CMakeLists.txt",

    "3rdparty/astc-codec/src/decoder/BUILD.bazel",
    "3rdparty/astc-codec/src/decoder/CMakeLists.txt",
    "3rdparty/astc-codec/src/decoder/testdata/atlas_small_4x4.astc",
    "3rdparty/astc-codec/src/decoder/testdata/atlas_small_4x4.bmp",

    "3rdparty/astc-codec/src/decoder/testdata/atlas_small_5x5.astc",
    "3rdparty/astc-codec/src/decoder/testdata/atlas_small_5x5.bmp",
    "3rdparty/astc-codec/src/decoder/testdata/atlas_small_6x6.astc",
    "3rdparty/astc-codec/src/decoder/testdata/atlas_small_6x6.bmp",
    "3rdparty/astc-codec/src/decoder/testdata/atlas_small_8x8.astc",
    "3rdparty/astc-codec/src/decoder/testdata/atlas_small_8x8.bmp",
    "3rdparty/astc-codec/src/decoder/testdata/checkerboard.astc",
    "3rdparty/astc-codec/src/decoder/testdata/checkered_10.astc",
    "3rdparty/astc-codec/src/decoder/testdata/checkered_11.astc",
    "3rdparty/astc-codec/src/decoder/testdata/checkered_12.astc",
    "3rdparty/astc-codec/src/decoder/testdata/checkered_4.astc",
    "3rdparty/astc-codec/src/decoder/testdata/checkered_5.astc",
    "3rdparty/astc-codec/src/decoder/testdata/checkered_6.astc",
    "3rdparty/astc-codec/src/decoder/testdata/checkered_7.astc",
    "3rdparty/astc-codec/src/decoder/testdata/checkered_8.astc",
    "3rdparty/astc-codec/src/decoder/testdata/checkered_9.astc",
    "3rdparty/astc-codec/src/decoder/testdata/footprint_10x10.astc",
    "3rdparty/astc-codec/src/decoder/testdata/footprint_10x10.bmp",
    "3rdparty/astc-codec/src/decoder/testdata/footprint_10x5.astc",
    "3rdparty/astc-codec/src/decoder/testdata/footprint_10x5.bmp",
    "3rdparty/astc-codec/src/decoder/testdata/footprint_10x6.astc",
    "3rdparty/astc-codec/src/decoder/testdata/footprint_10x6.bmp",
    "3rdparty/astc-codec/src/decoder/testdata/footprint_10x8.astc",
    "3rdparty/astc-codec/src/decoder/testdata/footprint_10x8.bmp",
    "3rdparty/astc-codec/src/decoder/testdata/footprint_12x10.astc",
    "3rdparty/astc-codec/src/decoder/testdata/footprint_12x10.bmp",
    "3rdparty/astc-codec/src/decoder/testdata/footprint_12x12.astc",
    "3rdparty/astc-codec/src/decoder/testdata/footprint_12x12.bmp",
    "3rdparty/astc-codec/src/decoder/testdata/footprint_4x4.astc",
    "3rdparty/astc-codec/src/decoder/testdata/footprint_4x4.bmp",
    "3rdparty/astc-codec/src/decoder/testdata/footprint_5x4.astc",
    "3rdparty/astc-codec/src/decoder/testdata/footprint_5x4.bmp",
    "3rdparty/astc-codec/src/decoder/testdata/footprint_5x5.astc",
    "3rdparty/astc-codec/src/decoder/testdata/footprint_5x5.bmp",
    "3rdparty/astc-codec/src/decoder/testdata/footprint_6x5.astc",
    "3rdparty/astc-codec/src/decoder/testdata/footprint_6x5.bmp",
    "3rdparty/astc-codec/src/decoder/testdata/footprint_6x6.astc",
    "3rdparty/astc-codec/src/decoder/testdata/footprint_6x6.bmp",
    "3rdparty/astc-codec/src/decoder/testdata/footprint_8x5.astc",
    "3rdparty/astc-codec/src/decoder/testdata/footprint_8x5.bmp",
    "3rdparty/astc-codec/src/decoder/testdata/footprint_8x6.astc",
    "3rdparty/astc-codec/src/decoder/testdata/footprint_8x6.bmp",
    "3rdparty/astc-codec/src/decoder/testdata/footprint_8x8.astc",
    "3rdparty/astc-codec/src/decoder/testdata/footprint_8x8.bmp",
    "3rdparty/astc-codec/src/decoder/testdata/rgb_12x12.astc",
    "3rdparty/astc-codec/src/decoder/testdata/rgb_12x12.bmp",
    "3rdparty/astc-codec/src/decoder/testdata/rgb_4x4.astc",
    "3rdparty/astc-codec/src/decoder/testdata/rgb_4x4.bmp",
    "3rdparty/astc-codec/src/decoder/testdata/rgb_5x4.astc",
    "3rdparty/astc-codec/src/decoder/testdata/rgb_5x4.bmp",
    "3rdparty/astc-codec/src/decoder/testdata/rgb_6x6.astc",
    "3rdparty/astc-codec/src/decoder/testdata/rgb_6x6.bmp",
    "3rdparty/astc-codec/src/decoder/testdata/rgb_8x8.astc",
    "3rdparty/astc-codec/src/decoder/testdata/rgb_8x8.bmp",
    "3rdparty/libsquish/singlecolourlookup.inl",
    "3rdparty/tinyexr/deps/miniz/ChangeLog.md",
    "3rdparty/tinyexr/deps/miniz/LICENSE",
    "3rdparty/tinyexr/deps/miniz/readme.md",

    "3rdparty/astc-codec/src/decoder/test/astc_fuzzer.cc",
    "3rdparty/astc-codec/src/decoder/test/codec_test.cc",
    "3rdparty/astc-codec/src/decoder/test/endpoint_codec_test.cc",
    "3rdparty/astc-codec/src/decoder/test/footprint_test.cc",
    "3rdparty/astc-codec/src/decoder/test/image_utils.h",
    "3rdparty/astc-codec/src/decoder/test/integer_sequence_codec_test.cc",
    "3rdparty/astc-codec/src/decoder/test/intermediate_astc_block_test.cc",
    "3rdparty/astc-codec/src/decoder/test/logical_astc_block_test.cc",
    "3rdparty/astc-codec/src/decoder/test/partition_test.cc",
    "3rdparty/astc-codec/src/decoder/test/physical_astc_block_test.cc",
    "3rdparty/astc-codec/src/decoder/test/quantization_test.cc",
    "3rdparty/astc-codec/src/decoder/test/weight_infill_test.cc",

    "3rdparty/tinyexr/deps/miniz/miniz.h",
]

let bgfxExcludes: [String] = [
    "src/amalgamated.cpp",
    "src/amalgamated.mm",
    "src/bgfx_p.h",
    "src/renderer_gl.h",
    "src/bgfx.idl.inl",
    
    "src/bgfx_compute.sh",
    "src/bgfx_shader.sh",
    "src/fs_clear0.sc",
    "src/fs_clear1.sc",
    "src/fs_clear2.sc",
    "src/fs_clear3.sc",
    "src/fs_clear4.sc",
    "src/fs_clear5.sc",
    "src/fs_clear6.sc",
    "src/fs_clear7.sc",
    "src/fs_debugfont.sc",
    "src/makefile",
    "src/varying.def.sc",
    "src/vs_clear.sc",
    "src/vs_debugfont.sc",
]

let package = Package(
    name: "bgfx",
    platforms: [
        .iOS(.v13),
        .macCatalyst(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "bgfx",
            targets: ["bgfx"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "SwiftBGFX",
            dependencies: [
                "bgfx",
            ]
        ),
        .target(
            name: "bgfx",
            dependencies: [
                "bx",
                "bimg"
            ],
            exclude: bgfxExcludes,
            sources: [
                "src"
            ],
            cxxSettings: [
                .define(
                    "BX_CONFIG_DEBUG",
                    to: "0",
                    nil
                ),
                .define(
                    "BGFX_CONFIG_RENDERER_METAL",
                    to: "1",
                    .when(
                        platforms: [
                            .iOS,
                            .macCatalyst,
                        ],
                        configuration: nil
                    )
                ),
                .unsafeFlags(["-fno-objc-arc"]),
            ]
        ),
        .target(
            name: "bx",
            exclude: ["src/amalgamated.cpp"],
            sources: ["src"],
            publicHeadersPath: "include",
            cxxSettings: [
                .headerSearchPath("3rdparty"),
                .define(
                    "BX_CONFIG_DEBUG",
                    to: "0",
                    nil
                ),
            ]
        ),
        .target(
            name: "bimg",
            dependencies: [
                "bx"
            ],
            exclude: bimgExcludes,
            sources: [
                "src",
                "3rdparty/libsquish",
                "3rdparty/astc-codec/src",
                "3rdparty/tinyexr/deps/miniz"
            ],
            publicHeadersPath: "include",
            cxxSettings: [
                .headerSearchPath("src"),
                .headerSearchPath("3rdparty"),
                // MARK: astc-codec
                .headerSearchPath("3rdparty/astc-codec"),
                .headerSearchPath("3rdparty/astc-codec/include"),
                
                .headerSearchPath("3rdparty/iqa/include"),
                
                .headerSearchPath("3rdparty/tinyexr"),
                .headerSearchPath("3rdparty/tinyexr/deps/miniz"),
                
                .define(
                    "BX_CONFIG_DEBUG",
                    to: "0",
                    nil
                ),
            ]
        ),
        .testTarget(
            name: "bgfxTests",
            dependencies: [
                "bgfx",
            ]
        ),
    ],
    cxxLanguageStandard: .cxx17
)
