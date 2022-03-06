package set summary "Audio codec"
package set webpage "https://www.opus-codec.org"
package set git.url "https://github.com/xiph/opus.git"
package set src.url "https://archive.mozilla.org/pub/opus/opus-1.3.1.tar.gz"
package set src.sum "65b58e1e25b2a114157014736a3d9dfeaad8d41be1c8179866f144a2fb44ff9d"
package set license "BSD-3-Clause"
package set bsystem "configure"

build() {
    configure \
        --disable-assertions \
        --disable-extra-programs \
        --disable-doc \
        --enable-asm
}
