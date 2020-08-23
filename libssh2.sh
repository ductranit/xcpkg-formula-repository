summary="C library implementing the SSH2 protocol"
homepage="https://libssh2.org"
url="https://libssh2.org/download/libssh2-1.9.0.tar.gz"
sha256="d5fb8bd563305fd1074dda90bd053fb2d29fc4bce048d182f96eaa466dfadafd"
dependencies="libgcrypt"

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
        --disable-examples-build \
        --disable-werror \
        --disable-rpath \
        --enable-static \
        --enable-shared \
        --enable-largefile \
        --with-crypto=libgcrypt \
        --with-libgcrypt-prefix="$libgcrypt_DIR_INSTALL_PREFIX" \
        --with-libz
        CC="$CC" \
        CFLAGS="$CFLAGS" \
        CPPFLAGS="$CPPFLAGS" \
        LDFLAGS="$LDFLAGS" \
        AR="$AR" \
        RANLIB="$RANLIB" \
        PKG_CONFIG='' && \
    make clean &&
    make install-includeHEADERS &&
    make -C src install
}
