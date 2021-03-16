summary "Extraction utility for .zip compressed archives"
webpage "https://infozip.sourceforge.io/UnZip.html"
src_url "https://downloads.sourceforge.net/project/infozip/UnZip%206.x%20%28latest%29/UnZip%206.0/unzip60.tar.gz"
src_sum "036d96991646d0449ed0aa952e4fbe21b476ce994abc276e49d30e686708bd37"
version "6.0-26"
bsystem "make"
require "patch"
depends "zip bzip2"
patches "https://dl.bintray.com/fpliu/ndk-pkg-src/unzip_$(version).debian.tar.xz" \
        "88cb7c0f1fd13252b662dfd224b64b352f9e75cd86389557fcb23fa6d2638599"
# https://packages.debian.org/buster/unzip

prepare() {
    tar xf $(patches) -C "$SOURCE_DIR" || return 1
    while read patch
    do
        patch -p1 < "debian/patches/$patch" || return 1
    done < debian/patches/series
    sed_in_place '/-DNO_/c :' unix/configure
}

build_in_sourced

build() {
    make -f unix/Makefile clean &&
    make -f unix/Makefile generic \
        CC="'$CC $CFLAGS $CPPFLAGS $LDFLAGS -include string.h'" \
        AS="$AS" \
        STRIP="$STRIP" &&
    make -f unix/Makefile install \
        prefix="$ABI_INSTALL_DIR" \
        MANDIR="$ABI_INSTALL_DIR/share/man/man1"
}
