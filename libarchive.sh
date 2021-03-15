summary "Multi-format archive and compression library"
webpage "https://www.libarchive.org"
src_url "https://www.libarchive.org/downloads/libarchive-3.4.3.tar.xz"
src_sum "0bfc3fd40491768a88af8d9b86bf04a9e95b6d41a94f9292dbc0ec342288c05f"
bsystem "configure"
depends "libiconv expat openssl xz bzip2 lz4 lzo zstd"

build() {
    configure \
        --enable-xattr \
        --enable-acl \
        --enable-bsdtar=static \
        --enable-bsdcat=static \
        --enable-bsdcpio=static \
        --without-xml2 \
        --with-expat \
        --with-openssl \
        --without-mbedtls \
        --without-nettle \
        --without-cng \
        --with-zlib \
        --with-lzma \
        --with-bz2lib \
        --with-lz4 \
        --with-lzo2 \
        --with-zstd \
        --without-libb2 \
        --with-iconv
}
