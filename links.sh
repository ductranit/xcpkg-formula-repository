summary="Lynx-like WWW browser that supports tables, menus, etc."
homepage="http://links.twibright.com"
url="http://links.twibright.com/download/links-2.21.tar.bz2"
sha256="285eed8591c7781ec26213df82786665aaa1b9286782e8a7a1a7e2a6e1630d63"
license="GPL-2.0"
dependencies="xz bzip2 libtiff libjpeg-turbo openssl"


prepare() {
    gen_c_file_stub_system &&
    sed_in_place "1i #include<$C_FILE_STUB_SYSTEM>" drivers.c &&
    sed_in_place 's/system(/stub_system(/g'         drivers.c &&
    sed_in_place 's/system(/stub_system(/g'              os_dep.c &&
    sed_in_place "1i extern int stub_system(char *cmd);" os_dep.c
}

# configure [options] [host]
build() {
    cd "$SOURCE_DIR" &&
    ./configure \
        --host="$BUILD_FOR_HOST" \
        --prefix="$ABI_INSTALL_DIR" \
        --enable-ipv6 \
        --enable-utf8 \
        --disable-graphics \
        --without-x \
        --with-zlib \
        --with-lzma \
        --with-bzip2 \
        --with-libtiff \
        --with-libjpeg \
        --with-ssl="$openssl_INSTALL_DIR" &&
    $MAKE clean &&
    $MAKE &&
    $MAKE install &&
    $MAKE distclean
}
