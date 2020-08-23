summary="GNU multiple precision arithmetic library"
homepage="https://gmplib.org"
url="https://gmplib.org/download/gmp/gmp-6.2.0.tar.xz"
sha256="258e6cd51b3fbdfc185c716d55f82c08aff57df0c6fbd143cf6ed561267a1526"

prepare() {
    curl -L -o config.sub   "http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.sub;hb=HEAD" &&
    curl -L -o config.guess "http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess;hb=HEAD" &&
    sed_in_place 's/arm64-*/arm64-*|arm64e-*/g' config.sub
}

#https://stackoverflow.com/questions/22754077/building-a-c-library-gmp-for-arm64-ios
build() {
    [ -f Makefile ] && make distclean
    ./configure \
        --host="$TARGET_HOST" \
        --prefix="$DIR_INSTALL_PREFIX" \
        --with-sysroot="$SYSROOT" \
        --without-readline \
        --disable-profiling \
        --disable-assert \
        --disable-cxx \
        --disable-shared \
        --enable-static \
        --disable-assembly \
        --enable-fft \
        CC_FOR_BUILD=/usr/bin/cc \
        CC="$CC" \
        CFLAGS="$CFLAGS" \
        CXX="$CXX" \
        CXXFLAGS="$CXXFLAGS" \
        CPPFLAGS="$CPPFLAGS" \
        LDFLAGS="$LDFLAGS" \
        AR="$AR" \
        RANLIB="$RANLIB" \
        PKG_CONFIG='' && \
    make clean &&
    make install
}
