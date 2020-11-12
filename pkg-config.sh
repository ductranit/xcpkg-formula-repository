summary="Manage compile and link flags for libraries"
homepage="https://freedesktop.org/wiki/Software/pkg-config"
url="https://pkgconfig.freedesktop.org/releases/pkg-config-0.29.2.tar.gz"
sha256="6fc69c01688c9458a57eb9a1664c9aba372ccda420a02bf4429fe610e7e7d591"
dependencies="libiconv"

prepare() {
    CACHE_FILE="$SOURCE_DIR/glib/configure.cache"
}

build() {
    gen_glib_configure_cache_file &&
    configure \
        --with-internal-glib \
        --disable-host-tool \
        --cache-file="$SOURCE_DIR/glib/configure.cache"
}

gen_glib_configure_cache_file() {
    cat > "$CACHE_FILE" <<EOF
glib_cv_stack_grows=no
glib_cv_working_bcopy=no
glib_cv_uscore=no
ac_cv_func_posix_getpwuid_r=no
ac_cv_func_posix_getgrgid_r=no
EOF
}
