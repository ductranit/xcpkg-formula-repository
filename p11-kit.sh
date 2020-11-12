summary="Library to load and enumerate PKCS#11 modules"
homepage="https://p11-glue.freedesktop.org"
url="https://github.com/p11-glue/p11-kit/releases/download/0.23.20/p11-kit-0.23.20.tar.xz"
sha256="14d86024c3dfd6b967d9bc0b4ec7b2973014fe7423481f4d230a1a63b8aa6104"

# ld: targeted OS version does not support use of thread local variables in _thread_local_message for architecture x86_64

prepare() {
    # p11-kit cannot be used as a static library
    sed_in_place 's/if test "$enable_static" = "yes"; then/if false ; then/' configure &&
    fetch_config_sub   build/litter &&
    fetch_config_guess build/litter
}

build() {
    configure \
        --without-systemd \
        --without-libtasn1 \
        --without-libffi \
        --with-bash-completion \
        --disable-coverage \
        --disable-strict \
        --disable-doc
}
