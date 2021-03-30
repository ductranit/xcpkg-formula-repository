summary "Lynx-like WWW browser that supports tables, menus, etc."
webpage "http://links.twibright.com"
src_url "http://links.twibright.com/download/links-2.21.tar.bz2"
src_sum "285eed8591c7781ec26213df82786665aaa1b9286782e8a7a1a7e2a6e1630d63"
license "GPL-2.0"
bsystem "make"
depends "xz bzip2 libtiff libjpeg-turbo openssl"


prepare() {
    inject_stub_system drivers.c os_dep.c
}

build_in_sourced

build() {
    # configure [options] [host]
    run ./configure \
        --host="$TARGET_TRIPLE" \
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
    make clean &&
    make &&
    make install &&
    make distclean
}
