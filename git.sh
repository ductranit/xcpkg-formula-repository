summary="Distributed revision control system"
homepage="https://git-scm.com"
url="https://www.kernel.org/pub/software/scm/git/git-2.27.0.tar.xz"
sha256="73ca9774d7fa226e1d87c1909401623f96dca6a044e583b9a762e84d7d1a73f9"
dependencies="libiconv expat curl openssl pcre2"

prepare() {
    {
        if [ "$XTRACE" = 'true' ] ; then
            sed_in_place '1a set -x' configure
        fi
    } &&
    sed_in_place 's/test "$cross_compiling" = yes/false/g' configure &&
    sed_in_place 's/ac_fn_c_try_run "$LINENO"/true/g' configure &&
    sed_in_place '/uname_S :=/c uname_S := Darwin' config.mak.uname &&
    gen_c_file_stub_system &&
    sed_in_place "1i #include<$C_FILE_STUB_SYSTEM>" t/helper/test-drop-caches.c &&
    sed_in_place 's/system(/stub_system(/g'         t/helper/test-drop-caches.c &&
    fetch_config_sub &&
    fetch_config_guess
}

build() {
    ./configure \
        --host="$TARGET_HOST" \
        --prefix="$DIR_INSTALL_PREFIX" \
        --with-iconv="$libiconv_DIR_INSTALL_PREFIX" \
        --with-expat="$expat_DIR_INSTALL_PREFIX" \
        --with-curl="$curl_DIR_INSTALL_PREFIX" \
        --with-openssl="$openssl_DIR_INSTALL_PREFIX" \
        --with-libpcre2="$pcre2_DIR_INSTALL_PREFIX" \
        --with-zlib \
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
