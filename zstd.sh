summary "Zstandard is a real-time compression algorithm"
webpage "https://facebook.github.io/zstd"
src_url "https://github.com/facebook/zstd/releases/download/v1.4.5/zstd-1.4.5.tar.gz"
src_sum "98e91c7c6bf162bf90e4e70fdbc41a8188b9fa8de5ad840c401198014406ce9e"
depends "xz"

prepare() {
    SOURCE_DIR="$WORKING_DIR/build/cmake"
}

build() {
    cmake \
        -DZSTD_MULTITHREAD_SUPPORT=ON \
        -DZSTD_BUILD_TESTS=OFF \
        -DZSTD_BUILD_CONTRIB=OFF \
        -DZSTD_BUILD_PROGRAMS=ON \
        -DZSTD_BUILD_STATIC=ON \
        -DZSTD_BUILD_SHARED=OFF \
        -DZSTD_ZLIB_SUPPORT=ON \
        -DZSTD_LZMA_SUPPORT=ON \
        -DZSTD_LZ4_SUPPORT=OFF \
        -DLIBLZMA_INCLUDE_DIR="$xz_INCLUDE_DIR" \
        -DLIBLZMA_LIBRARY="$xz_LIBRARY_DIR/liblzma.a"
}
