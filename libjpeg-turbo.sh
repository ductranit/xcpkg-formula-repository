summary "JPEG image codec that aids compression and decompression"
webpage "https://www.libjpeg-turbo.org"
src_git "https://github.com/libjpeg-turbo/libjpeg-turbo.git"
src_url "https://downloads.sourceforge.net/project/libjpeg-turbo/2.0.6/libjpeg-turbo-2.0.6.tar.gz"
src_sum "d74b92ac33b0e3657123ddcf6728788c90dc84dcb6a52013d758af3c4af481bb"
license "IJG"
bsystem "cmake"
require "nasm"

build() {
    case $BUILD_FOR_ARCH in
        i386|x86_64)
            WITH_SIMD=ON;;
        *)  WITH_SIMD=OFF;;
    esac

    cmake \
        -DENABLE_STATIC=ON \
        -DENABLE_SHARED=ON \
        -DWITH_JAVA=OFF \
        -DWITH_SIMD="$WITH_SIMD" \
        -DFORCE_INLINE=ON
}
