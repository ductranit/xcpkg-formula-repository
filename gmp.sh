summary "GNU multiple precision arithmetic library"
webpage "https://gmplib.org"
src_url "https://gmplib.org/download/gmp/gmp-6.2.0.tar.xz"
src_sum "258e6cd51b3fbdfc185c716d55f82c08aff57df0c6fbd143cf6ed561267a1526"

# https://stackoverflow.com/questions/22754077/building-a-c-library-gmp-for-arm64-ios

build() {
    configure \
        --without-readline \
        --disable-profiling \
        --disable-assert \
        --disable-cxx \
        --disable-assembly \
        --enable-fft
}
