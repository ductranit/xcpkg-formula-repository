summary  "Multi-format archive and compression library"
homepage "https://www.libarchive.org"
url      "https://www.libarchive.org/downloads/libarchive-3.4.3.tar.xz"
sha256   "0bfc3fd40491768a88af8d9b86bf04a9e95b6d41a94f9292dbc0ec342288c05f"
dependencies "libiconv expat openssl xz bzip2 lz4 lzo zstd"

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
