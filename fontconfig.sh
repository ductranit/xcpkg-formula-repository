summary "XML-based font configuration tools"
webpage "https://wiki.freedesktop.org/www/Software/fontconfig"
src_git "https://gitlab.freedesktop.org/fontconfig/fontconfig"
src_url "https://www.freedesktop.org/software/fontconfig/release/fontconfig-2.13.1.tar.bz2"
src_sum "f655dd2a986d7aa97e052261b36aa67b0a64989496361eca8d604e6414006741"
license "MIT"
bsystem "configure"
require "pkg-config gperf"
depends "gettext libiconv util-linux json-c expat freetype2-with-harfbuzz"
ldflags "-lbz2 -lz -lm -lbrotlidec -lbrotlicommon -lpng -lharfbuzz -lglib-2.0 -liconv -lintl"

prepare() {
    sed_in_place 's|po-conf test|po-conf|' Makefile.in
}

build() {
    configure \
        --enable-iconv \
        --enable-docs \
        --with-libiconv-prefix="$libiconv_INSTALL_DIR" \
        --with-libintl-prefix="$gettext_INSTALL_DIR" \
        --with-expat="$expat_INSTALL_DIR"
}
