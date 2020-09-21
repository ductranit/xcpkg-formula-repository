summary="Official documentation format of the GNU project"
homepage="https://www.gnu.org/software/texinfo"
url="https://ftp.gnu.org/gnu/texinfo/texinfo-6.7.tar.xz"
sha256="988403c1542d15ad044600b909997ba3079b10e03224c61188117f3676b02caa"
license="GPL-3.0"

prepare() {
    fetch_config_sub   build-aux &&
    fetch_config_guess build-aux
}

build() {
    ./configure \
        --host="$TARGET_HOST" \
        --prefix="$DIR_INSTALL_PREFIX" \
        --with-included-regex \
        --enable-threads=posix \
        --enable-largefile \
        --disable-rpath \
        --disable-nls \
        CC="$CC" \
        CFLAGS="$CFLAGS" \
        CPPFLAGS="$CPPFLAGS" \
        LDFLAGS="$LDFLAGS" \
        AR="$AR" \
        RANLIB="$RANLIB" &&
    sed_in_place 's|$(top_builddir)/$(native_tools)/info/makedoc $(cmd_sources)|touch funs.h|' info/Makefile &&
    make clean &&
    make install
}
