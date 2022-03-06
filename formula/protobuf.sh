package set summary "Protocol Buffers(data interchange format) compiler and library developed by Google"
package set git.url "https://github.com/protocolbuffers/protobuf.git"
package set src.url "https://github.com/protocolbuffers/protobuf/releases/download/v3.19.4/protobuf-all-3.19.4.tar.gz"
package set src.sum "ba0650be1b169d24908eeddbe6107f011d8df0da5b1a5a4449a913b10e578faf"
package set license "BSD-3-Clause"
package set dep.pkg "zlib"
package set bsystem "cmake"
package set sourced "cmake"

build0() {
    # used by other package. makew sure protoc and libprotoc same version
    cmakew \
        -Dprotobuf_BUILD_TESTS=OFF \
        -Dprotobuf_BUILD_EXAMPLES=OFF
}

build() {
    cmakew \
        -Dprotobuf_BUILD_TESTS=OFF \
        -Dprotobuf_BUILD_EXAMPLES=OFF \
        -DZLIB_INCLUDE_DIR="$zlib_INCLUDE_DIR" \
        -DZLIB_LIBRARY_RELEASE="$zlib_LIBRARY_DIR/libz.a"
}
