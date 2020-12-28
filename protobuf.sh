summary "Protocol buffers (Google's data interchange format)"
webpage "https://github.com/protocolbuffers/protobuf"
src_url "https://github.com/protocolbuffers/protobuf/releases/download/v3.13.0/protobuf-all-3.13.0.tar.gz"
src_sum "465fd9367992a9b9c4fba34a549773735da200903678b81b25f367982e8df376"
license "BSD-3-Clause"

prepare() {
    SOURCE_DIR="$WORKING_DIR/cmake"
}

build() {
    cmake \
        -Dprotobuf_BUILD_TESTS=OFF \
        -Dprotobuf_BUILD_EXAMPLES=OFF
}
