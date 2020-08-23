summary="Secure hashing function"
homepage="https://blake2.net"
url="https://github.com/BLAKE2/libb2/releases/download/v0.98.1/libb2-0.98.1.tar.gz"
sha256="53626fddce753c454a3fea581cbbc7fe9bbcf0bc70416d48fdbbf5d87ef6c72e"

#https://github.com/quiet/quiet/issues/23
#https://github.com/jgaeddert/liquid-dsp/pull/62/files#diff-4bb328fbe3180ab54cff2f63f71c3a77
prepare() {
    sed_in_place '/AX_GCC_X86_CPUID(0x00000001)/a ecx=0\nedx=0\nif test "$ax_cv_gcc_x86_cpuid_0x00000001" != "unknown"; then' m4/ax_ext.m4 &&
    sed_in_place '/AC_CACHE_CHECK(\[whether mmx is supported\]/i fi' m4/ax_ext.m4 &&
    curl -L -o config.sub   "http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.sub;hb=HEAD" &&
    curl -L -o config.guess "http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess;hb=HEAD" &&
    sed_in_place 's/arm64-*/arm64-*|arm64e-*/g' config.sub
}

build() {
    ./configure \
        --host="$TARGET_HOST" \
        --prefix="$DIR_INSTALL_PREFIX" \
        --with-sysroot="$SYSROOT" \
        --disable-debug \
        --disable-openmp \
        --disable-fat \
        --disable-shared \
        --enable-static \
        --enable-native \
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
