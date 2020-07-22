summary="Open video compression format"
homepage="https://www.theora.org"
url="https://downloads.xiph.org/releases/theora/libtheora-1.1.1.tar.bz2"
sha256="b6ae1ee2fa3d42ac489287d3ec34c5885730b1296f0801ae577a35193d3affbc"
dependencies="libogg libvorbis sdl2"

prepare() {
    sed_in_place '$d' autogen.sh && ./autogen.sh
}

build() {
    ./configure \
        --host="$TARGET_HOST" \
        --prefix="$DIR_INSTALL_PREFIX" \
        --with-sysroot="$SYSROOT" \
        --with-ogg="$libogg_DIR_INSTALL_PREFIX" \
        --with-vorbis="$libvorbis_DIR_INSTALL_PREFIX" \
        --with-sdl-prefix="$sdl2_DIR_INSTALL_PREFIX" \
        --disable-examples \
        --disable-shared \
        --enable-static \
        --enable-asm \
        CC="$CC" \
        CFLAGS="$CFLAGS" \
        CPP="$CPP" \
        CPPFLAGS="$CPPFLAGS" \
        LDFLAGS="$LDFLAGS" \
        AR="$AR" \
        RANLIB="$RANLIB" \
        PKG_CONFIG="" &&
    make clean &&
    make install
}
