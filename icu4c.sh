summary "C/C++ and Java libraries for Unicode and globalization"
webpage "http://site.icu-project.org/home"
version "67.1"
src_url "https://github.com/unicode-org/icu/releases/download/release-67-1/icu4c-67_1-src.tgz"
src_sum "94a80cd6f251a53bd2a997f6f1b5ac6653fe791dfab66e1eb0227740fb86d5dc"
license "ICU"
require "make"
sourced "source"

prepare() {
    # https://www.talkwithdevices.com/archives/260
    mkdir "$SOURCE_DIR/build.d.tmp" &&
    cd    "$SOURCE_DIR/build.d.tmp" &&
    "$SOURCE_DIR/runConfigureICU" MacOSX &&
    make &&
    cd "$SOURCE_DIR" &&
    cp config/mh-darwin config/mh-unknown &&
    inject_stub_system tools/tzcode/zic.c tools/pkgdata/pkgdata.cpp
}

build() {
    configure \
        --with-cross-build="$SOURCE_DIR/build.d.tmp" \
        --enable-release \
        --enable-tools \
        --enable-fuzzer \
        --disable-tests \
        --disable-samples
}
