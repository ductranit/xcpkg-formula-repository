summary "Interpreted, interactive, object-oriented programming language"
webpage "https://www.python.org"
src_url "https://www.python.org/ftp/python/3.9.1/Python-3.9.1.tar.xz"
src_sum "991c3f8ac97992f3d308fefeb03a64db462574eadbff34ce8bc5bb583d9903ff"
license "Python-2.0"
require "make"
depends "expat libffi openssl readline sqlite bzip2 xz"

prepare() {
    sed_in_place 's|@echo|echo|g' Makefile.pre.in &&
    NATIVE_BUILD_DIR="$WORKING_DIR/$TIMESTAMP_UNIX/native" &&
    mkdir -p "$NATIVE_BUILD_DIR" &&
    cd "$NATIVE_BUILD_DIR" &&
    "$SOURCE_DIR/configure" --prefix=$PWD/output &&
    $MAKE &&
    $MAKE install &&
    export PATH="$NATIVE_BUILD_DIR/output/bin:$PATH"
}

build() {
    configure \
        --build=$($SOURCE_DIR/config.guess) \
        --with-system-expat \
        --with-system-ffi \
        --with-openssl="$openssl_INSTALL_DIR" \
        --with-ensurepip=yes \
        --with-lto \
        --enable-ipv6 \
        --enable-loadable-sqlite-extensions \
        --disable-profiling \
        ac_cv_file__dev_ptmx=yes \
        ac_cv_file__dev_ptc=no \
        ac_cv_func_wcsftime=no \
        ac_cv_func_ftime=no \
        ac_cv_func_faccessat=no \
        ac_cv_func_gethostbyname_r=no \
        ac_cv_func_linkat=no \
        ac_cv_posix_semaphores_enabled=no \
        ac_cv_func_sem_open=no \
        ac_cv_func_sem_timedwait=no \
        ac_cv_func_sem_getvalue=no \
        ac_cv_func_sem_unlink=no \
        ac_cv_buggy_getaddrinfo=no \
        ac_cv_little_endian_double=yes
}
