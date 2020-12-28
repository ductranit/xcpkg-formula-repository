summary "C library to parse Metalink XML files"
webpage "https://launchpad.net/libmetalink"
src_url "https://launchpad.net/libmetalink/trunk/libmetalink-0.1.3/+download/libmetalink-0.1.3.tar.xz"
src_sum "86312620c5b64c694b91f9cc355eabbd358fa92195b3e99517504076bf9fe33a"
depends "expat"

build() {
    configure \
        --with-libexpat=yes \
        --with-libxml2=no \
        --with-xml-prefix="$expat_INSTALL_DIR" \
        --disable-xmltest \
        ac_cv_func_malloc_0_nonnull=yes \
        ac_cv_func_realloc_0_nonnull=yes
}
