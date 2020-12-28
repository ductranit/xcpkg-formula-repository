summary "Extremely Fast Compression algorithm"
webpage "https://lz4.org"
src_url "https://github.com/lz4/lz4/archive/v1.9.2.tar.gz"
src_sum "658ba6191fa44c92280d4aa2c271b0f4fbc0e34d249578dd05e50e76d0e5efcc"

build() {
    $MAKE -C "$SOURCE_DIR" clean &&
    $MAKE -C "$SOURCE_DIR" install \
        TARGET_OS=Darwin \
        PREFIX="$ABI_INSTALL_DIR" \
        CC="$CC" \
        CFLAGS="$CFLAGS" \
        LDFLAGS="$LDFLAGS" \
        AR="$AR" \
        BUILD_STATIC=yes \
        BUILD_SHARED=yes
}
