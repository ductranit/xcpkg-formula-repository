summary="C library for multiple-precision floating-point computations"
homepage="https://www.mpfr.org"
url="https://ftp.gnu.org/gnu/mpfr/mpfr-4.1.0.tar.xz"
sha256="0c98a3f1732ff6ca4ea690552079da9c597872d30e96ec28414ee23c95558a7f"
dependencies="gmp"

prepare() {
    curl -L -o config.sub   "http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.sub;hb=HEAD" &&
    curl -L -o config.guess "http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess;hb=HEAD" &&
    sed_in_place 's/arm64-*/arm64-*|arm64e-*/g' config.sub
}

build() {
    ./configure \
        --host="$TARGET_HOST" \
        --prefix="$DIR_INSTALL_PREFIX" \
        --with-sysroot="$SYSROOT" \
        --with-gmp="$gmp_DIR_INSTALL_PREFIX" \
        --disable-logging \
        --disable-assert \
        --disable-shared \
        --enable-static \
        --enable-lto \
        --enable-warnings \
        CC="$CC" \
        CFLAGS="$CFLAGS" \
        CPPFLAGS="$CPPFLAGS" \
        LDFLAGS="$LDFLAGS" \
        AR="$AR" \
        RANLIB="$RANLIB" \
        PKG_CONFIG='' && \
    make clean &&
    make install
}
