// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import Foundation
import PackageDescription

let package = Package(
    name: "bgfx",
    platforms: [
        .iOS(.v13),
        .macCatalyst(.v13)
    ],
    products: [
        .library(
            name: "bgfx",
            targets: ["bgfx"]
        ),
        .library(
            name: "bimg",
            targets: ["bimg"]
        ),
        .library(
            name: "bx",
            targets: ["bx"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "bgfx",
            dependencies: [
                "bx",
                "bimg"
            ],
            sources: [
                "src/amalgamated.mm",
            ],
            cxxSettings: [
                .headerSearchPath("3rdparty"),
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
            exclude: [
                "3rdparty/tinyexr/deps/miniz/miniz.h",
                "3rdparty/astc-codec/src/base/test",
                "3rdparty/astc-codec/src/decoder/test",
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
                "3rdparty/astc-codec/src/decoder/tools/astc_inspector_cli.cc",
                "3rdparty/astc/license.txt",
                "3rdparty/astc/readme.txt",
                "3rdparty/edtaa3/LICENSE.md",
                "3rdparty/etc1/LICENSE",
                "3rdparty/etc2/LICENSE.txt",
                "3rdparty/libsquish/LICENSE",
                "3rdparty/libsquish/README",
                "3rdparty/libsquish/singlecolourlookup.inl",
                "3rdparty/nvtt/NVIDIA_Texture_Tools_LICENSE.txt",
                "3rdparty/nvtt/nvcore/array.inl",
                "3rdparty/nvtt/nvmath/matrix.inl",
                "3rdparty/nvtt/nvmath/plane.inl",
                "3rdparty/nvtt/nvmath/vector.inl",
                "3rdparty/pvrtc/LICENSE.TXT",
                "3rdparty/pvrtc/README.md",
                "3rdparty/tinyexr/deps/miniz/ChangeLog.md",
                "3rdparty/tinyexr/deps/miniz/LICENSE",
                "3rdparty/tinyexr/deps/miniz/readme.md",
            ],
            sources: [
                "src",
                "3rdparty/astc",
                "3rdparty/astc-codec/src",
                "3rdparty/edtaa3",
                "3rdparty/etc1",
                "3rdparty/etc2",
                "3rdparty/iqa/source",
                "3rdparty/libsquish",
                "3rdparty/nvtt",
                "3rdparty/pvrtc",
                "3rdparty/tinyexr/deps/miniz"
            ],
            publicHeadersPath: "include",
            cxxSettings: [
                .headerSearchPath("src"),
                .headerSearchPath("3rdparty"),
                .headerSearchPath("3rdparty/astc"),
                .headerSearchPath("3rdparty/astc-codec"),
                .headerSearchPath("3rdparty/astc-codec/include"),
                .headerSearchPath("3rdparty/edtaa3"),
                .headerSearchPath("3rdparty/etc1"),
                .headerSearchPath("3rdparty/etc2"),
                .headerSearchPath("3rdparty/iqa/include"),
                .headerSearchPath("3rdparty/libsquish"),
                .headerSearchPath("3rdparty/lodepng"),
                .headerSearchPath("3rdparty/nvtt"),
                .headerSearchPath("3rdparty/pvrtc"),
                .headerSearchPath("3rdparty/stb"),
                .headerSearchPath("3rdparty/tinyexr"),
                .headerSearchPath("3rdparty/tinyexr/deps/miniz"),
                .define(
                    "BX_CONFIG_DEBUG",
                    to: "0",
                    nil
                ),
                // Supressing warnings to avoid trying to fix submodules
                .unsafeFlags(["-w"]),
            ]
        ),
    ],
    cxxLanguageStandard: .cxx17
)
