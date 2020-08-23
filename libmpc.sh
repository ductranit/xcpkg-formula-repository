summary="C library for the arithmetic of high precision complex numbers"
homepage="http://www.multiprecision.org/mpc"
url="https://ftp.gnu.org/gnu/mpc/mpc-1.1.0.tar.gz"
sha256="6985c538143c1208dcb1ac42cedad6ff52e267b47e5f970183a3e75125b43c2e"
dependencies="gmp mpfr"

prepare() {
    fetch "http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.sub;hb=HEAD"   --output-file=config.sub &&
    fetch "http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess;hb=HEAD" --output-file=config.guess &&
    sed_in_place 's/arm64-*/arm64-*|arm64e-*/g' config.sub
}

build() {
    ./configure \
        --host="$TARGET_HOST" \
        --prefix="$DIR_INSTALL_PREFIX" \
        --with-gmp="$gmp_DIR_INSTALL_PREFIX" \
        --with-mpfr="$mpfr_DIR_INSTALL_PREFIX" \
        --disable-logging \
        --disable-valgrind-tests \
        --disable-shared \
        --enable-static \
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
