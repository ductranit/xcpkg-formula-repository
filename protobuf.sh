summary "Protocol buffers (Google's data interchange format)"
webpage "https://github.com/protocolbuffers/protobuf"
src_git "https://github.com/protocolbuffers/protobuf.git"
src_url "https://github.com/protocolbuffers/protobuf/releases/download/v3.13.0/protobuf-all-3.13.0.tar.gz"
src_sum "465fd9367992a9b9c4fba34a549773735da200903678b81b25f367982e8df376"
license "BSD-3-Clause"
bsystem "cmake"
depends "zlib"
sourced "cmake"

build0() {
    # used by other package. make sure protoc and libprotoc same version
    cmake \
        -Dprotobuf_BUILD_TESTS=OFF \
        -Dprotobuf_BUILD_EXAMPLES=OFF
}

build() {
    cmake \
        -Dprotobuf_BUILD_TESTS=OFF \
        -Dprotobuf_BUILD_EXAMPLES=OFF \
        -DZLIB_INCLUDE_DIR="$zlib_INCLUDE_DIR" \
        -DZLIB_LIBRARY_RELEASE="$zlib_LIBRARY_DIR/libz.a"
}
