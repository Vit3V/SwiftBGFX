//
//  File.swift
//  
//
//  Created by Vitalijs Vasilevskis on 05/06/2022.
//

import Foundation

public let BGFX_API_VERSION: __uint32_t = 115

/**
 * Color RGB/alpha/depth write. When it's not specified write will be disabled.
 *
 */
public let BGFX_STATE_WRITE_R: __uint64_t = 0x0000000000000001 //!< Enable R write.
public let BGFX_STATE_WRITE_G: __uint64_t = 0x0000000000000002 //!< Enable G write.
public let BGFX_STATE_WRITE_B: __uint64_t = 0x0000000000000004 //!< Enable B write.
public let BGFX_STATE_WRITE_A: __uint64_t = 0x0000000000000008 //!< Enable alpha write.
public let BGFX_STATE_WRITE_Z: __uint64_t = 0x0000004000000000 //!< Enable depth write.
///// Enable RGB write.
var BGFX_STATE_WRITE_RGB: __uint64_t {
    return (
        0 |
        BGFX_STATE_WRITE_R |
        BGFX_STATE_WRITE_G |
        BGFX_STATE_WRITE_B
    )
}

///// Write all channels mask.
var BGFX_STATE_WRITE_MASK: __uint64_t {
    return (
        0 |
        BGFX_STATE_WRITE_RGB |
        BGFX_STATE_WRITE_A |
        BGFX_STATE_WRITE_Z
    )
}

/**
 * Depth test state. When `BGFX_STATE_DEPTH_` is not specified depth test will be disabled.
 *
 */
public let BGFX_STATE_DEPTH_TEST_LESS                : __uint64_t = 0x0000000000000010 //!< Enable depth test, less.
public let BGFX_STATE_DEPTH_TEST_LEQUAL              : __uint64_t = 0x0000000000000020 //!< Enable depth test, less or equal.
public let BGFX_STATE_DEPTH_TEST_EQUAL               : __uint64_t = 0x0000000000000030 //!< Enable depth test, equal.
public let BGFX_STATE_DEPTH_TEST_GEQUAL              : __uint64_t = 0x0000000000000040 //!< Enable depth test, greater or equal.
public let BGFX_STATE_DEPTH_TEST_GREATER             : __uint64_t = 0x0000000000000050 //!< Enable depth test, greater.
public let BGFX_STATE_DEPTH_TEST_NOTEQUAL            : __uint64_t = 0x0000000000000060 //!< Enable depth test, not equal.
public let BGFX_STATE_DEPTH_TEST_NEVER               : __uint64_t = 0x0000000000000070 //!< Enable depth test, never.
public let BGFX_STATE_DEPTH_TEST_ALWAYS              : __uint64_t = 0x0000000000000080 //!< Enable depth test, always.
public let BGFX_STATE_DEPTH_TEST_SHIFT               : __uint64_t = 4                            //!< Depth test state bit shift
public let BGFX_STATE_DEPTH_TEST_MASK                : __uint64_t = 0x00000000000000f0 //!< Depth test state bit mask

/**
 * Use BGFX_STATE_BLEND_FUNC(_src, _dst) or BGFX_STATE_BLEND_FUNC_SEPARATE(_srcRGB, _dstRGB, _srcA, _dstA)
 * helper macros.
 *
 */
public let BGFX_STATE_BLEND_ZERO                     : __uint64_t = 0x0000000000001000 //!< 0, 0, 0, 0
public let BGFX_STATE_BLEND_ONE                      : __uint64_t = 0x0000000000002000 //!< 1, 1, 1, 1
public let BGFX_STATE_BLEND_SRC_COLOR                : __uint64_t = 0x0000000000003000 //!< Rs, Gs, Bs, As
public let BGFX_STATE_BLEND_INV_SRC_COLOR            : __uint64_t = 0x0000000000004000 //!< 1-Rs, 1-Gs, 1-Bs, 1-As
public let BGFX_STATE_BLEND_SRC_ALPHA                : __uint64_t = 0x0000000000005000 //!< As, As, As, As
public let BGFX_STATE_BLEND_INV_SRC_ALPHA            : __uint64_t = 0x0000000000006000 //!< 1-As, 1-As, 1-As, 1-As
public let BGFX_STATE_BLEND_DST_ALPHA                : __uint64_t = 0x0000000000007000 //!< Ad, Ad, Ad, Ad
public let BGFX_STATE_BLEND_INV_DST_ALPHA            : __uint64_t = 0x0000000000008000 //!< 1-Ad, 1-Ad, 1-Ad ,1-Ad
public let BGFX_STATE_BLEND_DST_COLOR                : __uint64_t = 0x0000000000009000 //!< Rd, Gd, Bd, Ad
public let BGFX_STATE_BLEND_INV_DST_COLOR            : __uint64_t = 0x000000000000a000 //!< 1-Rd, 1-Gd, 1-Bd, 1-Ad
public let BGFX_STATE_BLEND_SRC_ALPHA_SAT            : __uint64_t = 0x000000000000b000 //!< f, f, f, 1; f = min(As, 1-Ad)
public let BGFX_STATE_BLEND_FACTOR                   : __uint64_t = 0x000000000000c000 //!< Blend factor
public let BGFX_STATE_BLEND_INV_FACTOR               : __uint64_t = 0x000000000000d000 //!< 1-Blend factor
public let BGFX_STATE_BLEND_SHIFT: __uint64_t = 12                           //!< Blend state bit shift
public let BGFX_STATE_BLEND_MASK                     : __uint64_t = 0x000000000ffff000 //!< Blend state bit mask

/**
 * Use BGFX_STATE_BLEND_EQUATION(_equation) or BGFX_STATE_BLEND_EQUATION_SEPARATE(_equationRGB, _equationA)
 * helper macros.
 *
 */
public let BGFX_STATE_BLEND_EQUATION_ADD             : __uint64_t = 0x0000000000000000 //!< Blend add: src + dst.
public let BGFX_STATE_BLEND_EQUATION_SUB             : __uint64_t = 0x0000000010000000 //!< Blend subtract: src - dst.
public let BGFX_STATE_BLEND_EQUATION_REVSUB          : __uint64_t = 0x0000000020000000 //!< Blend reverse subtract: dst - src.
public let BGFX_STATE_BLEND_EQUATION_MIN             : __uint64_t = 0x0000000030000000 //!< Blend min: min(src, dst).
public let BGFX_STATE_BLEND_EQUATION_MAX             : __uint64_t = 0x0000000040000000 //!< Blend max: max(src, dst).
public let BGFX_STATE_BLEND_EQUATION_SHIFT: __uint64_t = 28                           //!< Blend equation bit shift
public let BGFX_STATE_BLEND_EQUATION_MASK            : __uint64_t = 0x00000003f0000000 //!< Blend equation bit mask

/**
 * Cull state. When `BGFX_STATE_CULL_*` is not specified culling will be disabled.
 *
 */
public let BGFX_STATE_CULL_CW                        : __uint64_t = 0x0000001000000000 //!< Cull clockwise triangles.
public let BGFX_STATE_CULL_CCW                       : __uint64_t = 0x0000002000000000 //!< Cull counter-clockwise triangles.
public let BGFX_STATE_CULL_SHIFT: __uint64_t = 36                           //!< Culling mode bit shift
public let BGFX_STATE_CULL_MASK                      : __uint64_t = 0x0000003000000000 //!< Culling mode bit mask

/**
 * Alpha reference value.
 *
 */
public let BGFX_STATE_ALPHA_REF_SHIFT: __uint64_t = 40                           //!< Alpha reference bit shift
public let BGFX_STATE_ALPHA_REF_MASK                 : __uint64_t = 0x0000ff0000000000 //!< Alpha reference bit mask
public func BGFX_STATE_ALPHA_REF(_ input: __uint64_t) -> __uint64_t {
    return (
        (input << BGFX_STATE_ALPHA_REF_SHIFT) &
        BGFX_STATE_ALPHA_REF_MASK
    )
}

public let BGFX_STATE_PT_TRISTRIP                    : __uint64_t = 0x0001000000000000 //!< Tristrip.
public let BGFX_STATE_PT_LINES                       : __uint64_t = 0x0002000000000000 //!< Lines.
public let BGFX_STATE_PT_LINESTRIP                   : __uint64_t = 0x0003000000000000 //!< Line strip.
public let BGFX_STATE_PT_POINTS                      : __uint64_t = 0x0004000000000000 //!< Points.
public let BGFX_STATE_PT_SHIFT: __uint64_t = 48                           //!< Primitive type bit shift
public let BGFX_STATE_PT_MASK                        : __uint64_t = 0x0007000000000000 //!< Primitive type bit mask

/**
 * Point size value.
 *
 */
public let BGFX_STATE_POINT_SIZE_SHIFT: __uint64_t = 52                           //!< Point size bit shift
public let BGFX_STATE_POINT_SIZE_MASK: __uint64_t = 0x00f0000000000000 //!< Point size bit mask
public func BGFX_STATE_POINT_SIZE(_ input: __uint64_t) -> __uint64_t {
    return (input << BGFX_STATE_POINT_SIZE_SHIFT) & BGFX_STATE_POINT_SIZE_MASK
}

/**
 * Enable MSAA write when writing into MSAA frame buffer.
 * This flag is ignored when not writing into MSAA frame buffer.
 *
 */
public let BGFX_STATE_MSAA                           : __uint64_t = 0x0100000000000000 //!< Enable MSAA rasterization.
public let BGFX_STATE_LINEAA                         : __uint64_t = 0x0200000000000000 //!< Enable line AA rasterization.
public let BGFX_STATE_CONSERVATIVE_RASTER            : __uint64_t = 0x0400000000000000 //!< Enable conservative rasterization.
public let BGFX_STATE_NONE                           : __uint64_t = 0x0000000000000000 //!< No state.
public let BGFX_STATE_FRONT_CCW                      : __uint64_t = 0x0000008000000000 //!< Front counter-clockwise (default is clockwise).
public let BGFX_STATE_BLEND_INDEPENDENT              : __uint64_t = 0x0000000400000000 //!< Enable blend independent.
public let BGFX_STATE_BLEND_ALPHA_TO_COVERAGE        : __uint64_t = 0x0000000800000000 //!< Enable alpha to coverage.
/// Default state is write to RGB, alpha, and depth with depth test less enabled, with clockwise
/// culling and MSAA (when writing into MSAA frame buffer, otherwise this flag is ignored).
public let BGFX_STATE_DEFAULT = BGFX_STATE_WRITE_RGB | BGFX_STATE_WRITE_A | BGFX_STATE_WRITE_Z | BGFX_STATE_DEPTH_TEST_LESS | BGFX_STATE_CULL_CW | BGFX_STATE_MSAA

public let BGFX_STATE_MASK                           : __uint64_t = 0xffffffffffffffff //!< State bit mask

/**
 * Do not use!
 *
 */
public let BGFX_STATE_RESERVED_SHIFT: __uint64_t = 61

public let BGFX_STATE_RESERVED_MASK                  : __uint64_t = 0xe000000000000000

/**
 * Set stencil ref value.
 *
 */
public let BGFX_STENCIL_FUNC_REF_SHIFT: __uint32_t = 0

public let BGFX_STENCIL_FUNC_REF_MASK                : __uint32_t = 0x000000ff
public func BGFX_STENCIL_FUNC_REF(_ input: __uint32_t) -> __uint32_t {
    return (input << BGFX_STENCIL_FUNC_REF_SHIFT) & BGFX_STENCIL_FUNC_REF_MASK
}

/**
 * Set stencil rmask value.
 *
 */
public let BGFX_STENCIL_FUNC_RMASK_SHIFT: __uint32_t = 8

public let BGFX_STENCIL_FUNC_RMASK_MASK: __uint32_t = 0x0000ff00
public func BGFX_STENCIL_FUNC_RMASK(_ input: __uint32_t) -> __uint32_t {
    return (input << BGFX_STENCIL_FUNC_RMASK_SHIFT) & BGFX_STENCIL_FUNC_RMASK_MASK
}

public let BGFX_STENCIL_NONE                         : __uint32_t = 0x00000000
public let BGFX_STENCIL_MASK                         : __uint32_t = 0xffffffff
public let BGFX_STENCIL_DEFAULT                      : __uint32_t = 0x00000000

public let BGFX_STENCIL_TEST_LESS                    : __uint32_t = 0x00010000 //!< Enable stencil test, less.
public let BGFX_STENCIL_TEST_LEQUAL                  : __uint32_t = 0x00020000 //!< Enable stencil test, less or equal.
public let BGFX_STENCIL_TEST_EQUAL                   : __uint32_t = 0x00030000 //!< Enable stencil test, equal.
public let BGFX_STENCIL_TEST_GEQUAL                  : __uint32_t = 0x00040000 //!< Enable stencil test, greater or equal.
public let BGFX_STENCIL_TEST_GREATER                 : __uint32_t = 0x00050000 //!< Enable stencil test, greater.
public let BGFX_STENCIL_TEST_NOTEQUAL                : __uint32_t = 0x00060000 //!< Enable stencil test, not equal.
public let BGFX_STENCIL_TEST_NEVER                   : __uint32_t = 0x00070000 //!< Enable stencil test, never.
public let BGFX_STENCIL_TEST_ALWAYS                  : __uint32_t = 0x00080000 //!< Enable stencil test, always.
public let BGFX_STENCIL_TEST_SHIFT: __uint32_t = 16                   //!< Stencil test bit shift
public let BGFX_STENCIL_TEST_MASK                    : __uint32_t = 0x000f0000 //!< Stencil test bit mask

public let BGFX_STENCIL_OP_FAIL_S_ZERO               : __uint32_t = 0x00000000 //!< Zero.
public let BGFX_STENCIL_OP_FAIL_S_KEEP               : __uint32_t = 0x00100000 //!< Keep.
public let BGFX_STENCIL_OP_FAIL_S_REPLACE            : __uint32_t = 0x00200000 //!< Replace.
public let BGFX_STENCIL_OP_FAIL_S_INCR               : __uint32_t = 0x00300000 //!< Increment and wrap.
public let BGFX_STENCIL_OP_FAIL_S_INCRSAT            : __uint32_t = 0x00400000 //!< Increment and clamp.
public let BGFX_STENCIL_OP_FAIL_S_DECR               : __uint32_t = 0x00500000 //!< Decrement and wrap.
public let BGFX_STENCIL_OP_FAIL_S_DECRSAT            : __uint32_t = 0x00600000 //!< Decrement and clamp.
public let BGFX_STENCIL_OP_FAIL_S_INVERT             : __uint32_t = 0x00700000 //!< Invert.
public let BGFX_STENCIL_OP_FAIL_S_SHIFT: __uint32_t = 20                   //!< Stencil operation fail bit shift
public let BGFX_STENCIL_OP_FAIL_S_MASK               : __uint32_t = 0x00f00000 //!< Stencil operation fail bit mask

public let BGFX_STENCIL_OP_FAIL_Z_ZERO               : __uint32_t = 0x00000000 //!< Zero.
public let BGFX_STENCIL_OP_FAIL_Z_KEEP               : __uint32_t = 0x01000000 //!< Keep.
public let BGFX_STENCIL_OP_FAIL_Z_REPLACE            : __uint32_t = 0x02000000 //!< Replace.
public let BGFX_STENCIL_OP_FAIL_Z_INCR               : __uint32_t = 0x03000000 //!< Increment and wrap.
public let BGFX_STENCIL_OP_FAIL_Z_INCRSAT            : __uint32_t = 0x04000000 //!< Increment and clamp.
public let BGFX_STENCIL_OP_FAIL_Z_DECR               : __uint32_t = 0x05000000 //!< Decrement and wrap.
public let BGFX_STENCIL_OP_FAIL_Z_DECRSAT            : __uint32_t = 0x06000000 //!< Decrement and clamp.
public let BGFX_STENCIL_OP_FAIL_Z_INVERT             : __uint32_t = 0x07000000 //!< Invert.
public let BGFX_STENCIL_OP_FAIL_Z_SHIFT: __uint32_t = 24                   //!< Stencil operation depth fail bit shift
public let BGFX_STENCIL_OP_FAIL_Z_MASK               : __uint32_t = 0x0f000000 //!< Stencil operation depth fail bit mask

public let BGFX_STENCIL_OP_PASS_Z_ZERO               : __uint32_t = 0x00000000 //!< Zero.
public let BGFX_STENCIL_OP_PASS_Z_KEEP               : __uint32_t = 0x10000000 //!< Keep.
public let BGFX_STENCIL_OP_PASS_Z_REPLACE            : __uint32_t = 0x20000000 //!< Replace.
public let BGFX_STENCIL_OP_PASS_Z_INCR               : __uint32_t = 0x30000000 //!< Increment and wrap.
public let BGFX_STENCIL_OP_PASS_Z_INCRSAT            : __uint32_t = 0x40000000 //!< Increment and clamp.
public let BGFX_STENCIL_OP_PASS_Z_DECR               : __uint32_t = 0x50000000 //!< Decrement and wrap.
public let BGFX_STENCIL_OP_PASS_Z_DECRSAT            : __uint32_t = 0x60000000 //!< Decrement and clamp.
public let BGFX_STENCIL_OP_PASS_Z_INVERT             : __uint32_t = 0x70000000 //!< Invert.
public let BGFX_STENCIL_OP_PASS_Z_SHIFT: __uint32_t = 28                   //!< Stencil operation depth pass bit shift
public let BGFX_STENCIL_OP_PASS_Z_MASK               : __uint32_t = 0xf0000000 //!< Stencil operation depth pass bit mask

public let BGFX_CLEAR_NONE                           : __uint16_t = 0x0000 //!< No clear flags.
public let BGFX_CLEAR_COLOR                          : __uint16_t = 0x0001 //!< Clear color.
public let BGFX_CLEAR_DEPTH                          : __uint16_t = 0x0002 //!< Clear depth.
public let BGFX_CLEAR_STENCIL                        : __uint16_t = 0x0004 //!< Clear stencil.
public let BGFX_CLEAR_DISCARD_COLOR_0                : __uint16_t = 0x0008 //!< Discard frame buffer attachment 0.
public let BGFX_CLEAR_DISCARD_COLOR_1                : __uint16_t = 0x0010 //!< Discard frame buffer attachment 1.
public let BGFX_CLEAR_DISCARD_COLOR_2                : __uint16_t = 0x0020 //!< Discard frame buffer attachment 2.
public let BGFX_CLEAR_DISCARD_COLOR_3                : __uint16_t = 0x0040 //!< Discard frame buffer attachment 3.
public let BGFX_CLEAR_DISCARD_COLOR_4                : __uint16_t = 0x0080 //!< Discard frame buffer attachment 4.
public let BGFX_CLEAR_DISCARD_COLOR_5                : __uint16_t = 0x0100 //!< Discard frame buffer attachment 5.
public let BGFX_CLEAR_DISCARD_COLOR_6                : __uint16_t = 0x0200 //!< Discard frame buffer attachment 6.
public let BGFX_CLEAR_DISCARD_COLOR_7                : __uint16_t = 0x0400 //!< Discard frame buffer attachment 7.
public let BGFX_CLEAR_DISCARD_DEPTH                  : __uint16_t = 0x0800 //!< Discard frame buffer depth attachment.
public let BGFX_CLEAR_DISCARD_STENCIL                : __uint16_t = 0x1000 //!< Discard frame buffer stencil attachment.

public let BGFX_CLEAR_DISCARD_COLOR_MASK: __uint16_t = (
    0 |
    BGFX_CLEAR_DISCARD_COLOR_0 |
    BGFX_CLEAR_DISCARD_COLOR_1 |
    BGFX_CLEAR_DISCARD_COLOR_2 |
    BGFX_CLEAR_DISCARD_COLOR_3 |
    BGFX_CLEAR_DISCARD_COLOR_4 |
    BGFX_CLEAR_DISCARD_COLOR_5 |
    BGFX_CLEAR_DISCARD_COLOR_6 |
    BGFX_CLEAR_DISCARD_COLOR_7
)

public let BGFX_CLEAR_DISCARD_MASK: __uint16_t = (
    0
    | BGFX_CLEAR_DISCARD_COLOR_MASK
    | BGFX_CLEAR_DISCARD_DEPTH
    | BGFX_CLEAR_DISCARD_STENCIL
)


/**
 * Rendering state discard. When state is preserved in submit, rendering states can be discarded
 * on a finer grain.
 *
 */
public let BGFX_DISCARD_NONE                         : __uint8_t = 0x00 //!< Preserve everything.
public let BGFX_DISCARD_BINDINGS                     : __uint8_t = 0x01 //!< Discard texture sampler and buffer bindings.
public let BGFX_DISCARD_INDEX_BUFFER                 : __uint8_t = 0x02 //!< Discard index buffer.
public let BGFX_DISCARD_INSTANCE_DATA                : __uint8_t = 0x04 //!< Discard instance data.
public let BGFX_DISCARD_STATE                        : __uint8_t = 0x08 //!< Discard state and uniform bindings.
public let BGFX_DISCARD_TRANSFORM                    : __uint8_t = 0x10 //!< Discard transform.
public let BGFX_DISCARD_VERTEX_STREAMS               : __uint8_t = 0x20 //!< Discard vertex streams.
public let BGFX_DISCARD_ALL                          : __uint8_t = 0xff //!< Discard all states.

public let BGFX_DEBUG_NONE                           : __uint32_t = 0x00000000 //!< No debug.
public let BGFX_DEBUG_WIREFRAME                      : __uint32_t = 0x00000001 //!< Enable wireframe for all primitives.

/// Enable infinitely fast hardware test. No draw calls will be submitted to driver.
/// It's useful when profiling to quickly assess bottleneck between CPU and GPU.
public let BGFX_DEBUG_IFH                            : __uint32_t = 0x00000002
public let BGFX_DEBUG_STATS                          : __uint32_t = 0x00000004 //!< Enable statistics display.
public let BGFX_DEBUG_TEXT                           : __uint32_t = 0x00000008 //!< Enable debug text display.
public let BGFX_DEBUG_PROFILER                       : __uint32_t = 0x00000010 //!< Enable profiler. This causes per-view statistics to be collected, available through `bgfx::Stats::ViewStats`. This is unrelated to the profiler functions in `bgfx::CallbackI`.

public let BGFX_BUFFER_COMPUTE_FORMAT_8X1            : __uint16_t = 0x0001 //!< 1 8-bit value
public let BGFX_BUFFER_COMPUTE_FORMAT_8X2            : __uint16_t = 0x0002 //!< 2 8-bit values
public let BGFX_BUFFER_COMPUTE_FORMAT_8X4            : __uint16_t = 0x0003 //!< 4 8-bit values
public let BGFX_BUFFER_COMPUTE_FORMAT_16X1           : __uint16_t = 0x0004 //!< 1 16-bit value
public let BGFX_BUFFER_COMPUTE_FORMAT_16X2           : __uint16_t = 0x0005 //!< 2 16-bit values
public let BGFX_BUFFER_COMPUTE_FORMAT_16X4           : __uint16_t = 0x0006 //!< 4 16-bit values
public let BGFX_BUFFER_COMPUTE_FORMAT_32X1           : __uint16_t = 0x0007 //!< 1 32-bit value
public let BGFX_BUFFER_COMPUTE_FORMAT_32X2           : __uint16_t = 0x0008 //!< 2 32-bit values
public let BGFX_BUFFER_COMPUTE_FORMAT_32X4           : __uint16_t = 0x0009 //!< 4 32-bit values
public let BGFX_BUFFER_COMPUTE_FORMAT_SHIFT: __uint16_t = 0

public let BGFX_BUFFER_COMPUTE_FORMAT_MASK           : __uint16_t = 0x000f

public let BGFX_BUFFER_COMPUTE_TYPE_INT              : __uint16_t = 0x0010 //!< Type `int`.
public let BGFX_BUFFER_COMPUTE_TYPE_UINT             : __uint16_t = 0x0020 //!< Type `uint`.
public let BGFX_BUFFER_COMPUTE_TYPE_FLOAT            : __uint16_t = 0x0030 //!< Type `float`.
public let BGFX_BUFFER_COMPUTE_TYPE_SHIFT: __uint16_t = 4

public let BGFX_BUFFER_COMPUTE_TYPE_MASK             : __uint16_t = 0x0030

public let BGFX_BUFFER_NONE                          : __uint16_t = 0x0000
public let BGFX_BUFFER_COMPUTE_READ                  : __uint16_t = 0x0100 //!< Buffer will be read by shader.
public let BGFX_BUFFER_COMPUTE_WRITE                 : __uint16_t = 0x0200 //!< Buffer will be used for writing.
public let BGFX_BUFFER_DRAW_INDIRECT                 : __uint16_t = 0x0400 //!< Buffer will be used for storing draw indirect commands.
public let BGFX_BUFFER_ALLOW_RESIZE                  : __uint16_t = 0x0800 //!< Allow dynamic index/vertex buffer resize during update.
public let BGFX_BUFFER_INDEX32                       : __uint16_t = 0x1000 //!< Index buffer contains 32-bit indices.
public let BGFX_BUFFER_COMPUTE_READ_WRITE: __uint16_t = (
    0
    | BGFX_BUFFER_COMPUTE_READ
    | BGFX_BUFFER_COMPUTE_WRITE
)


public let BGFX_TEXTURE_NONE                         : __uint64_t = 0x0000000000000000
public let BGFX_TEXTURE_MSAA_SAMPLE                  : __uint64_t = 0x0000000800000000 //!< Texture will be used for MSAA sampling.
public let BGFX_TEXTURE_RT                           : __uint64_t = 0x0000001000000000 //!< Render target no MSAA.
public let BGFX_TEXTURE_COMPUTE_WRITE                : __uint64_t = 0x0000100000000000 //!< Texture will be used for compute write.
public let BGFX_TEXTURE_SRGB                         : __uint64_t = 0x0000200000000000 //!< Sample texture as sRGB.
public let BGFX_TEXTURE_BLIT_DST                     : __uint64_t = 0x0000400000000000 //!< Texture will be used as blit destination.
public let BGFX_TEXTURE_READ_BACK                    : __uint64_t = 0x0000800000000000 //!< Texture will be used for read back from GPU.

public let BGFX_TEXTURE_RT_MSAA_X2                   : __uint64_t = 0x0000002000000000 //!< Render target MSAAx2 mode.
public let BGFX_TEXTURE_RT_MSAA_X4                   : __uint64_t = 0x0000003000000000 //!< Render target MSAAx4 mode.
public let BGFX_TEXTURE_RT_MSAA_X8                   : __uint64_t = 0x0000004000000000 //!< Render target MSAAx8 mode.
public let BGFX_TEXTURE_RT_MSAA_X16                  : __uint64_t = 0x0000005000000000 //!< Render target MSAAx16 mode.
public let BGFX_TEXTURE_RT_MSAA_SHIFT: __uint64_t = 36

public let BGFX_TEXTURE_RT_MSAA_MASK                 : __uint64_t = 0x0000007000000000

public let BGFX_TEXTURE_RT_WRITE_ONLY                : __uint64_t = 0x0000008000000000 //!< Render target will be used for writing
public let BGFX_TEXTURE_RT_SHIFT: __uint64_t = 36

public let BGFX_TEXTURE_RT_MASK: __uint64_t = 0x000000f000000000

/**
 * Sampler flags.
 *
 */
public let BGFX_SAMPLER_U_MIRROR                     : __uint32_t = 0x00000001 //!< Wrap U mode: Mirror
public let BGFX_SAMPLER_U_CLAMP                      : __uint32_t = 0x00000002 //!< Wrap U mode: Clamp
public let BGFX_SAMPLER_U_BORDER                     : __uint32_t = 0x00000003 //!< Wrap U mode: Border
public let BGFX_SAMPLER_U_SHIFT: __uint32_t = 0

public let BGFX_SAMPLER_U_MASK                       : __uint32_t = 0x00000003

public let BGFX_SAMPLER_V_MIRROR                     : __uint32_t = 0x00000004 //!< Wrap V mode: Mirror
public let BGFX_SAMPLER_V_CLAMP                      : __uint32_t = 0x00000008 //!< Wrap V mode: Clamp
public let BGFX_SAMPLER_V_BORDER                     : __uint32_t = 0x0000000c //!< Wrap V mode: Border
public let BGFX_SAMPLER_V_SHIFT: __uint32_t = 2

public let BGFX_SAMPLER_V_MASK                       : __uint32_t = 0x0000000c

public let BGFX_SAMPLER_W_MIRROR                     : __uint32_t = 0x00000010 //!< Wrap W mode: Mirror
public let BGFX_SAMPLER_W_CLAMP                      : __uint32_t = 0x00000020 //!< Wrap W mode: Clamp
public let BGFX_SAMPLER_W_BORDER                     : __uint32_t = 0x00000030 //!< Wrap W mode: Border
public let BGFX_SAMPLER_W_SHIFT: __uint32_t = 4

public let BGFX_SAMPLER_W_MASK                       : __uint32_t = 0x00000030

public let BGFX_SAMPLER_MIN_POINT                    : __uint32_t = 0x00000040 //!< Min sampling mode: Point
public let BGFX_SAMPLER_MIN_ANISOTROPIC              : __uint32_t = 0x00000080 //!< Min sampling mode: Anisotropic
public let BGFX_SAMPLER_MIN_SHIFT: __uint32_t = 6

public let BGFX_SAMPLER_MIN_MASK                     : __uint32_t = 0x000000c0

public let BGFX_SAMPLER_MAG_POINT                    : __uint32_t = 0x00000100 //!< Mag sampling mode: Point
public let BGFX_SAMPLER_MAG_ANISOTROPIC              : __uint32_t = 0x00000200 //!< Mag sampling mode: Anisotropic
public let BGFX_SAMPLER_MAG_SHIFT: __uint16_t = 8

public let BGFX_SAMPLER_MAG_MASK                     : __uint32_t = 0x00000300

public let BGFX_SAMPLER_MIP_POINT                    : __uint32_t = 0x00000400 //!< Mip sampling mode: Point
public let BGFX_SAMPLER_MIP_SHIFT: __uint32_t = 10

public let BGFX_SAMPLER_MIP_MASK                     : __uint32_t = 0x00000400

public let BGFX_SAMPLER_COMPARE_LESS                 : __uint32_t = 0x00010000 //!< Compare when sampling depth texture: less.
public let BGFX_SAMPLER_COMPARE_LEQUAL               : __uint32_t = 0x00020000 //!< Compare when sampling depth texture: less or equal.
public let BGFX_SAMPLER_COMPARE_EQUAL                : __uint32_t = 0x00030000 //!< Compare when sampling depth texture: equal.
public let BGFX_SAMPLER_COMPARE_GEQUAL               : __uint32_t = 0x00040000 //!< Compare when sampling depth texture: greater or equal.
public let BGFX_SAMPLER_COMPARE_GREATER              : __uint32_t = 0x00050000 //!< Compare when sampling depth texture: greater.
public let BGFX_SAMPLER_COMPARE_NOTEQUAL             : __uint32_t = 0x00060000 //!< Compare when sampling depth texture: not equal.
public let BGFX_SAMPLER_COMPARE_NEVER                : __uint32_t = 0x00070000 //!< Compare when sampling depth texture: never.
public let BGFX_SAMPLER_COMPARE_ALWAYS               : __uint32_t = 0x00080000 //!< Compare when sampling depth texture: always.
public let BGFX_SAMPLER_COMPARE_SHIFT: __uint32_t = 16

public let BGFX_SAMPLER_COMPARE_MASK                 : __uint32_t = 0x000f0000

public let BGFX_SAMPLER_BORDER_COLOR_SHIFT: __uint32_t = 24

public let BGFX_SAMPLER_BORDER_COLOR_MASK            : __uint32_t = 0x0f000000
public func BGFX_SAMPLER_BORDER_COLOR(_ input: __uint32_t) -> __uint32_t {
    return (input << BGFX_SAMPLER_BORDER_COLOR_SHIFT) & BGFX_SAMPLER_BORDER_COLOR_MASK
}

public let BGFX_SAMPLER_RESERVED_SHIFT: __uint32_t = 28

public let BGFX_SAMPLER_RESERVED_MASK: __uint32_t = 0xf0000000

public let BGFX_SAMPLER_NONE                         : __uint32_t = 0x00000000
public let BGFX_SAMPLER_SAMPLE_STENCIL               : __uint32_t = 0x00100000 //!< Sample stencil instead of depth.
public let BGFX_SAMPLER_POINT: __uint32_t = (
    0
    | BGFX_SAMPLER_MIN_POINT
    | BGFX_SAMPLER_MAG_POINT
    | BGFX_SAMPLER_MIP_POINT
)

public let BGFX_SAMPLER_UVW_MIRROR: __uint32_t = (
    0
    | BGFX_SAMPLER_U_MIRROR
    | BGFX_SAMPLER_V_MIRROR
    | BGFX_SAMPLER_W_MIRROR
)

public let BGFX_SAMPLER_UVW_CLAMP: __uint32_t = (
    0
    | BGFX_SAMPLER_U_CLAMP
    | BGFX_SAMPLER_V_CLAMP
    | BGFX_SAMPLER_W_CLAMP
)

public let BGFX_SAMPLER_UVW_BORDER: __uint32_t = (
    0
    | BGFX_SAMPLER_U_BORDER
    | BGFX_SAMPLER_V_BORDER
    | BGFX_SAMPLER_W_BORDER
)

public let BGFX_SAMPLER_BITS_MASK: __uint32_t = (
    0
    | BGFX_SAMPLER_U_MASK
    | BGFX_SAMPLER_V_MASK
    | BGFX_SAMPLER_W_MASK
    | BGFX_SAMPLER_MIN_MASK
    | BGFX_SAMPLER_MAG_MASK
    | BGFX_SAMPLER_MIP_MASK
    | BGFX_SAMPLER_COMPARE_MASK
)


public let BGFX_RESET_MSAA_X2                        : __uint32_t = 0x00000010 //!< Enable 2x MSAA.
public let BGFX_RESET_MSAA_X4                        : __uint32_t = 0x00000020 //!< Enable 4x MSAA.
public let BGFX_RESET_MSAA_X8                        : __uint32_t = 0x00000030 //!< Enable 8x MSAA.
public let BGFX_RESET_MSAA_X16                       : __uint32_t = 0x00000040 //!< Enable 16x MSAA.
public let BGFX_RESET_MSAA_SHIFT: __uint32_t = 4

public let BGFX_RESET_MSAA_MASK                      : __uint32_t = 0x00000070

public let BGFX_RESET_NONE                           : __uint32_t = 0x00000000 //!< No reset flags.
public let BGFX_RESET_FULLSCREEN                     : __uint32_t = 0x00000001 //!< Not supported yet.
public let BGFX_RESET_VSYNC                          : __uint32_t = 0x00000080 //!< Enable V-Sync.
public let BGFX_RESET_MAXANISOTROPY                  : __uint32_t = 0x00000100 //!< Turn on/off max anisotropy.
public let BGFX_RESET_CAPTURE                        : __uint32_t = 0x00000200 //!< Begin screen capture.
public let BGFX_RESET_FLUSH_AFTER_RENDER             : __uint32_t = 0x00002000 //!< Flush rendering after submitting to GPU.

/// This flag specifies where flip occurs. Default behaviour is that flip occurs
/// before rendering new frame. This flag only has effect when `BGFX_CONFIG_MULTITHREADED=0`.
public let BGFX_RESET_FLIP_AFTER_RENDER              : __uint32_t = 0x00004000
public let BGFX_RESET_SRGB_BACKBUFFER                : __uint32_t = 0x00008000 //!< Enable sRGB backbuffer.
public let BGFX_RESET_HDR10                          : __uint32_t = 0x00010000 //!< Enable HDR10 rendering.
public let BGFX_RESET_HIDPI                          : __uint32_t = 0x00020000 //!< Enable HiDPI rendering.
public let BGFX_RESET_DEPTH_CLAMP                    : __uint32_t = 0x00040000 //!< Enable depth clamp.
public let BGFX_RESET_SUSPEND                        : __uint32_t = 0x00080000 //!< Suspend rendering.

public let BGFX_RESET_FULLSCREEN_SHIFT: __uint32_t = 0

public let BGFX_RESET_FULLSCREEN_MASK                : __uint32_t = 0x00000001

public let BGFX_RESET_RESERVED_SHIFT: __uint32_t = 31                   //!< Internal bit shift
public let BGFX_RESET_RESERVED_MASK                  : __uint32_t = 0x80000000 //!< Internal bit mask

public let BGFX_CAPS_ALPHA_TO_COVERAGE               : __uint64_t = 0x0000000000000001 //!< Alpha to coverage is supported.
public let BGFX_CAPS_BLEND_INDEPENDENT               : __uint64_t = 0x0000000000000002 //!< Blend independent is supported.
public let BGFX_CAPS_COMPUTE                         : __uint64_t = 0x0000000000000004 //!< Compute shaders are supported.
public let BGFX_CAPS_CONSERVATIVE_RASTER             : __uint64_t = 0x0000000000000008 //!< Conservative rasterization is supported.
public let BGFX_CAPS_DRAW_INDIRECT                   : __uint64_t = 0x0000000000000010 //!< Draw indirect is supported.
public let BGFX_CAPS_FRAGMENT_DEPTH                  : __uint64_t = 0x0000000000000020 //!< Fragment depth is available in fragment shader.
public let BGFX_CAPS_FRAGMENT_ORDERING               : __uint64_t = 0x0000000000000040 //!< Fragment ordering is available in fragment shader.
public let BGFX_CAPS_GRAPHICS_DEBUGGER               : __uint64_t = 0x0000000000000080 //!< Graphics debugger is present.
public let BGFX_CAPS_HDR10                           : __uint64_t = 0x0000000000000100 //!< HDR10 rendering is supported.
public let BGFX_CAPS_HIDPI                           : __uint64_t = 0x0000000000000200 //!< HiDPI rendering is supported.
public let BGFX_CAPS_IMAGE_RW                        : __uint64_t = 0x0000000000000400 //!< Image Read/Write is supported.
public let BGFX_CAPS_INDEX32                         : __uint64_t = 0x0000000000000800 //!< 32-bit indices are supported.
public let BGFX_CAPS_INSTANCING                      : __uint64_t = 0x0000000000001000 //!< Instancing is supported.
public let BGFX_CAPS_OCCLUSION_QUERY                 : __uint64_t = 0x0000000000002000 //!< Occlusion query is supported.
public let BGFX_CAPS_RENDERER_MULTITHREADED          : __uint64_t = 0x0000000000004000 //!< Renderer is on separate thread.
public let BGFX_CAPS_SWAP_CHAIN                      : __uint64_t = 0x0000000000008000 //!< Multiple windows are supported.
public let BGFX_CAPS_TEXTURE_2D_ARRAY                : __uint64_t = 0x0000000000010000 //!< 2D texture array is supported.
public let BGFX_CAPS_TEXTURE_3D                      : __uint64_t = 0x0000000000020000 //!< 3D textures are supported.
public let BGFX_CAPS_TEXTURE_BLIT                    : __uint64_t = 0x0000000000040000 //!< Texture blit is supported.
public let BGFX_CAPS_TEXTURE_COMPARE_RESERVED        : __uint64_t = 0x0000000000080000
public let BGFX_CAPS_TEXTURE_COMPARE_LEQUAL          : __uint64_t = 0x0000000000100000 //!< Texture compare less equal mode is supported.
public let BGFX_CAPS_TEXTURE_CUBE_ARRAY              : __uint64_t = 0x0000000000200000 //!< Cubemap texture array is supported.
public let BGFX_CAPS_TEXTURE_DIRECT_ACCESS           : __uint64_t = 0x0000000000400000 //!< CPU direct access to GPU texture memory.
public let BGFX_CAPS_TEXTURE_READ_BACK               : __uint64_t = 0x0000000000800000 //!< Read-back texture is supported.
public let BGFX_CAPS_VERTEX_ATTRIB_HALF              : __uint64_t = 0x0000000001000000 //!< Vertex attribute half-float is supported.
public let BGFX_CAPS_VERTEX_ATTRIB_UINT10            : __uint64_t = 0x0000000002000000 //!< Vertex attribute 10_10_10_2 is supported.
public let BGFX_CAPS_VERTEX_ID                       : __uint64_t = 0x0000000004000000 //!< Rendering with VertexID only is supported.
public let BGFX_CAPS_VIEWPORT_LAYER_ARRAY            : __uint64_t = 0x0000000008000000 //!< Viewport layer is available in vertex shader.
/// All texture compare modes are supported.
public let BGFX_CAPS_TEXTURE_COMPARE_ALL: __uint64_t = (
    0
    | BGFX_CAPS_TEXTURE_COMPARE_RESERVED
    | BGFX_CAPS_TEXTURE_COMPARE_LEQUAL
)


public let BGFX_CAPS_FORMAT_TEXTURE_NONE             : __uint32_t = 0x00000000 //!< Texture format is not supported.
public let BGFX_CAPS_FORMAT_TEXTURE_2D               : __uint32_t = 0x00000001 //!< Texture format is supported.
public let BGFX_CAPS_FORMAT_TEXTURE_2D_SRGB          : __uint32_t = 0x00000002 //!< Texture as sRGB format is supported.
public let BGFX_CAPS_FORMAT_TEXTURE_2D_EMULATED      : __uint32_t = 0x00000004 //!< Texture format is emulated.
public let BGFX_CAPS_FORMAT_TEXTURE_3D               : __uint32_t = 0x00000008 //!< Texture format is supported.
public let BGFX_CAPS_FORMAT_TEXTURE_3D_SRGB          : __uint32_t = 0x00000010 //!< Texture as sRGB format is supported.
public let BGFX_CAPS_FORMAT_TEXTURE_3D_EMULATED      : __uint32_t = 0x00000020 //!< Texture format is emulated.
public let BGFX_CAPS_FORMAT_TEXTURE_CUBE             : __uint32_t = 0x00000040 //!< Texture format is supported.
public let BGFX_CAPS_FORMAT_TEXTURE_CUBE_SRGB        : __uint32_t = 0x00000080 //!< Texture as sRGB format is supported.
public let BGFX_CAPS_FORMAT_TEXTURE_CUBE_EMULATED    : __uint32_t = 0x00000100 //!< Texture format is emulated.
public let BGFX_CAPS_FORMAT_TEXTURE_VERTEX           : __uint32_t = 0x00000200 //!< Texture format can be used from vertex shader.
public let BGFX_CAPS_FORMAT_TEXTURE_IMAGE_READ       : __uint32_t = 0x00000400 //!< Texture format can be used as image and read from.
public let BGFX_CAPS_FORMAT_TEXTURE_IMAGE_WRITE      : __uint32_t = 0x00000800 //!< Texture format can be used as image and written to.
public let BGFX_CAPS_FORMAT_TEXTURE_FRAMEBUFFER      : __uint32_t = 0x00001000 //!< Texture format can be used as frame buffer.
public let BGFX_CAPS_FORMAT_TEXTURE_FRAMEBUFFER_MSAA : __uint32_t = 0x00002000 //!< Texture format can be used as MSAA frame buffer.
public let BGFX_CAPS_FORMAT_TEXTURE_MSAA             : __uint32_t = 0x00004000 //!< Texture can be sampled as MSAA.
public let BGFX_CAPS_FORMAT_TEXTURE_MIP_AUTOGEN      : __uint32_t = 0x00008000 //!< Texture format supports auto-generated mips.

public let BGFX_RESOLVE_NONE                         : __uint8_t = 0x00 //!< No resolve flags.
public let BGFX_RESOLVE_AUTO_GEN_MIPS                : __uint8_t = 0x01 //!< Auto-generate mip maps on resolve.

public let BGFX_PCI_ID_NONE                          : __uint16_t = 0x0000 //!< Autoselect adapter.
public let BGFX_PCI_ID_SOFTWARE_RASTERIZER           : __uint16_t = 0x0001 //!< Software rasterizer.
public let BGFX_PCI_ID_AMD                           : __uint16_t = 0x1002 //!< AMD adapter.
public let BGFX_PCI_ID_APPLE                         : __uint16_t = 0x106b //!< Apple adapter.
public let BGFX_PCI_ID_INTEL                         : __uint16_t = 0x8086 //!< Intel adapter.
public let BGFX_PCI_ID_NVIDIA                        : __uint16_t = 0x10de //!< nVidia adapter.
public let BGFX_PCI_ID_MICROSOFT                     : __uint16_t = 0x1414 //!< Microsoft adapter.

public let BGFX_CUBE_MAP_POSITIVE_X                  : __uint8_t = 0x00 //!< Cubemap +x.
public let BGFX_CUBE_MAP_NEGATIVE_X                  : __uint8_t = 0x01 //!< Cubemap -x.
public let BGFX_CUBE_MAP_POSITIVE_Y                  : __uint8_t = 0x02 //!< Cubemap +y.
public let BGFX_CUBE_MAP_NEGATIVE_Y                  : __uint8_t = 0x03 //!< Cubemap -y.
public let BGFX_CUBE_MAP_POSITIVE_Z                  : __uint8_t = 0x04 //!< Cubemap +z.
public let BGFX_CUBE_MAP_NEGATIVE_Z                  : __uint8_t = 0x05 //!< Cubemap -z.


/// Blend function separate.
public func BGFX_STATE_BLEND_FUNC_SEPARATE(srcRGB: __uint64_t, dstRGB: __uint64_t, srcA: __uint64_t, dstA: __uint64_t) -> __uint64_t {
    return (
        0 |
        (srcRGB | (dstRGB << 4)) |
        ((srcA | (dstA << 4)) << 8)
    )
}

/// Blend equation separate.
public func BGFX_STATE_BLEND_EQUATION_SEPARATE(equationRGB: __uint64_t, equationA: __uint64_t) -> __uint64_t {
    return equationRGB | (equationA << 3)
}

/// Blend function.
public func BGFX_STATE_BLEND_FUNC(src: __uint64_t, dst: __uint64_t) -> __uint64_t {
    BGFX_STATE_BLEND_FUNC_SEPARATE(srcRGB: src, dstRGB: dst, srcA: src, dstA: dst)
}

/// Blend equation.
public func BGFX_STATE_BLEND_EQUATION(equation: __uint64_t) -> __uint64_t {
    return BGFX_STATE_BLEND_EQUATION_SEPARATE(equationRGB: equation, equationA: equation)
}

/// Utility predefined blend modes.

/// Additive blending.
public let BGFX_STATE_BLEND_ADD: __uint64_t = (
    0 |
    BGFX_STATE_BLEND_FUNC(src: BGFX_STATE_BLEND_ONE, dst: BGFX_STATE_BLEND_ONE)
)

/// Alpha blend.
public let BGFX_STATE_BLEND_ALPHA: __uint64_t = (
    0 | BGFX_STATE_BLEND_FUNC(src: BGFX_STATE_BLEND_SRC_ALPHA, dst: BGFX_STATE_BLEND_INV_SRC_ALPHA)
)

/// Selects darker color of blend.
public let BGFX_STATE_BLEND_DARKEN: __uint64_t = (
    0 |
    BGFX_STATE_BLEND_FUNC(src: BGFX_STATE_BLEND_ONE, dst: BGFX_STATE_BLEND_ONE) |
    BGFX_STATE_BLEND_EQUATION(equation: BGFX_STATE_BLEND_EQUATION_MIN)
)

/// Selects lighter color of blend.
public let BGFX_STATE_BLEND_LIGHTEN: __uint64_t = (
    0 |
    BGFX_STATE_BLEND_FUNC(src: BGFX_STATE_BLEND_ONE, dst: BGFX_STATE_BLEND_ONE) |
    BGFX_STATE_BLEND_EQUATION(equation: BGFX_STATE_BLEND_EQUATION_MAX)
)

/// Multiplies colors.
public let BGFX_STATE_BLEND_MULTIPLY: __uint64_t = (
    0 |
    BGFX_STATE_BLEND_FUNC(src: BGFX_STATE_BLEND_DST_COLOR, dst: BGFX_STATE_BLEND_ZERO)
)

/// Opaque pixels will cover the pixels directly below them without any math or algorithm applied to them.
public let BGFX_STATE_BLEND_NORMAL: __uint64_t = (
    0 |
    BGFX_STATE_BLEND_FUNC(src: BGFX_STATE_BLEND_ONE, dst: BGFX_STATE_BLEND_INV_SRC_ALPHA)
)

/// Multiplies the inverse of the blend and base colors.
public let BGFX_STATE_BLEND_SCREEN: __uint64_t = (
    0 |
    BGFX_STATE_BLEND_FUNC(src: BGFX_STATE_BLEND_ONE, dst: BGFX_STATE_BLEND_INV_SRC_COLOR)
)

/// Decreases the brightness of the base color based on the value of the blend color.
public let BGFX_STATE_BLEND_LINEAR_BURN =  (
    0 |
    BGFX_STATE_BLEND_FUNC(src: BGFX_STATE_BLEND_DST_COLOR, dst: BGFX_STATE_BLEND_INV_DST_COLOR) |
    BGFX_STATE_BLEND_EQUATION(equation: BGFX_STATE_BLEND_EQUATION_SUB)
)

///
public func BGFX_STATE_BLEND_FUNC_RT_x(src: __uint32_t, dst: __uint32_t) -> __uint32_t {
    return 0 | (src >> BGFX_STATE_BLEND_SHIFT) | ((dst >> BGFX_STATE_BLEND_SHIFT) << 4)
}

///
public func BGFX_STATE_BLEND_FUNC_RT_xE(src: __uint32_t, dst: __uint32_t, equation: __uint32_t) -> __uint32_t {
    return 0 | BGFX_STATE_BLEND_FUNC_RT_x(src: src, dst: dst) | ((equation >> BGFX_STATE_BLEND_EQUATION_SHIFT) << 8)
}


public func BGFX_STATE_BLEND_FUNC_RT_1(src: __uint32_t, dst: __uint32_t) -> __uint32_t {
    return BGFX_STATE_BLEND_FUNC_RT_x(src: src, dst: dst) << 0
}
public func BGFX_STATE_BLEND_FUNC_RT_2(src: __uint32_t, dst: __uint32_t) -> __uint32_t {
    return BGFX_STATE_BLEND_FUNC_RT_x(src: src, dst: dst) << 11
}
public func BGFX_STATE_BLEND_FUNC_RT_3(src: __uint32_t, dst: __uint32_t) -> __uint32_t {
    return BGFX_STATE_BLEND_FUNC_RT_x(src: src, dst: dst) << 22
}

public func BGFX_STATE_BLEND_FUNC_RT_1E(src: __uint32_t, dst: __uint32_t, equation: __uint32_t) -> __uint32_t {
    return BGFX_STATE_BLEND_FUNC_RT_xE(src: src, dst: dst, equation: equation) << 0
}
public func BGFX_STATE_BLEND_FUNC_RT_2E(src: __uint32_t, dst: __uint32_t, equation: __uint32_t) -> __uint32_t {
    return BGFX_STATE_BLEND_FUNC_RT_xE(src: src, dst: dst, equation: equation) << 11
}
public func BGFX_STATE_BLEND_FUNC_RT_3E(src: __uint32_t, dst: __uint32_t, equation: __uint32_t) -> __uint32_t {
    return BGFX_STATE_BLEND_FUNC_RT_xE(src: src, dst: dst, equation: equation) << 22
}
