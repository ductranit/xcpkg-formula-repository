summary "Yacc-compatible Parser generator"
webpage "https://www.gnu.org/software/bison"
src_url "https://ftp.gnu.org/gnu/bison/bison-3.7.2.tar.xz"
src_sum "7948d193104d979c0fb0294a1854c73c89d72ae41acfc081826142578a78a91b"
license "GPL-3.0-or-later"

build() {
    configure \
        --enable-yacc \
        --enable-relocatable \
        --enable-threads=posix \
        --disable-gcc-warnings \
        --disable-assert
}