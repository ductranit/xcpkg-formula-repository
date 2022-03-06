package set summary "MP3 player"
package set webpage "https://www.mpg123.de"
package set src.url "https://www.mpg123.de/download/mpg123-1.29.3.tar.bz2"
package set src.sum "963885d8cc77262f28b77187c7d189e32195e64244de2530b798ddf32183e847"
package set bsystem "configure"
package set dep.cmd "pkg-config"

build() {
    configure \
        --enable-debug=no \
        --enable-ipv6=yes \
        --with-default-audio=coreaudio \
        --with-module-suffix=.dylib \
        --with-cpu="$(cpu)"
}

cpu() {
    case $TARGET_OS_ARCH in
        armv7*) echo neon   ;;
        arm64*) echo neon64 ;;
        i386)   echo i386   ;;
        x86_64) echo x86-64 ;;
        *)      echo "$TARGET_OS_ARCH"
    esac
}
