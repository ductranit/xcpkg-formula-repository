summary="Perl compatible regular expressions library with a new API"
homepage="https://www.pcre.org"
url="https://ftp.pcre.org/pub/pcre/pcre2-10.35.tar.bz2"
sha256="9ccba8e02b0ce78046cdfb52e5c177f0f445e421059e43becca4359c669d4613"

prepare() {
    curl -L -o config.sub   "http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.sub;hb=HEAD" &&
    curl -L -o config.guess "http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess;hb=HEAD" &&
    sed_in_place 's/arm64-*/arm64-*|arm64e-*/g' config.sub
}

build() {
    ./configure \
        --host="$TARGET_HOST" \
        --prefix="$DIR_INSTALL_PREFIX" \
        --disable-debug \
        --disable-valgrind \
        --disable-coverage \
        --disable-shared \
        --enable-static \
        --enable-unicode \
        --enable-pcre2-8 \
        --enable-pcre2-16 \
        --enable-pcre2-32 \
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
