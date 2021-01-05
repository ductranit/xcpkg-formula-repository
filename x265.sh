summary "H.265/HEVC encoder"
webpage "http://x265.org"
src_url "https://bitbucket.org/multicoreware/x265_git/get/3.4.tar.gz"
src_sum "7f2771799bea0f53b5ab47603d5bea46ea2a221e047a7ff398115e9976fd5f86"
sourced "source"

build() {
    cmake \
    -DENABLE_PIC=ON \
    -DENABLE_CLI=ON \
    -DENABLE_SHARED=ON \
    -DENABLE_ASSEMBLY=OFF
}
