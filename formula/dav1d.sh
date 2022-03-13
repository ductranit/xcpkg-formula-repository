package set summary "AV1 decoder targeted to be small and fast"
package set webpage "https://code.videolan.org/videolan/dav1d"
package set src.url "https://code.videolan.org/videolan/dav1d/-/archive/0.9.2/dav1d-0.9.2.tar.bz2"
package set src.sum "0d198c4fe63fe7f0395b1b17de75b21c8c4508cd3204996229355759efa30ef8"
package set license "BSD-2-Clause"
package set dep.cmd "nasm"
package set bsystem "meson"

build() {
    mesonw \
        -Denable_asm=true \
        -Denable_tools=true \
        -Denable_tests=false \
        -Denable_examples=false
}
