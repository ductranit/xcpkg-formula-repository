package set summary "Open video compression format"
package set webpage "https://www.theora.org"
package set src.git "https://github.com/xiph/theora.git"
package set src.url "https://github.com/xiph/theora/archive/refs/tags/v1.1.1.tar.gz"
package set src.sum "1d5c3b25bbced448f3e741c42df6796e3d5e57136a74bcd68262318290ec2982"
package set dep.pkg "libogg libvorbis sdl2"
package set bsystem "autogen"

prepare() {
    sed_in_place '$d' autogen.sh && ./autogen.sh
}

build() { 
    export CPPFLAGS="$CPPFLAGS -include stdint.h"
    configure \
        --with-ogg="$libogg_INSTALL_DIR" \
        --with-vorbis="$libvorbis_INSTALL_DIR" \
        --with-sdl-prefix="$sdl2_INSTALL_DIR" \
        --disable-examples \
        --enable-asm
}
