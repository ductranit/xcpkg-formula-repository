summary "Macro processing language"
webpage "https://www.gnu.org/software/m4"
src_url "https://ftp.gnu.org/gnu/m4/m4-1.4.18.tar.xz"
src_sum "f2c1e86ca0a404ff281631bdc8377638992744b175afb806e25871a24a934e07"
license "GPL-3.0"
bsystem "configure"

build() {
    configure \
        --enable-threads=posix \
        --enable-c++ \
        --enable-changeword \
        --disable-assert \
        --disable-gcc-warnings \
        --without-dmalloc \
        --with-included-regex
}
