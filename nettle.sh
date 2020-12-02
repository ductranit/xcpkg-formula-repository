summary  "Low-level cryptographic library"
homepage "https://www.lysator.liu.se/~nisse/nettle"
url      "https://ftp.gnu.org/gnu/nettle/nettle-3.6.tar.gz"
sha256   "d24c0d0f2abffbc8f4f34dcf114b0f131ec3774895f3555922fe2f40f3d5e3f1"
dependencies "gmp"

prepare() {
    sed_in_place '/cat >conftest.c <<EOF/a #include<stdlib.h>' configure &&
    sed_in_place 's/-soname=/-install_name,/g' configure
}

build() {
    configure \
        --with-include-path="$gmp_INCLUDE_DIR" \
        --with-lib-path="$gmp_LIBRARY_DIR" \
        --disable-fat \
        --disable-gcov \
        --disable-openssl \
        --disable-mini-gmp \
        --disable-assembler \
        --enable-documentation
}
