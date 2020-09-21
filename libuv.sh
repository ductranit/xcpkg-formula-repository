summary="Multi-platform support library with a focus on asynchronous I/O"
homepage="https://libuv.org"
url="https://dist.libuv.org/dist/v1.38.1/libuv-v1.38.1.tar.gz"
sha256="0ece7d279e480fa386b066130a562ad1a622079d43d1c30731f2f66cd3f5c647"

build() {
    cmake \
    -DLIBUV_BUILD_TESTS=OFF \
    -DLIBUV_BUILD_BENCH=OFF \
    -DQEMU=OFF
}
