summary "Play, record, convert, and stream audio and video"
webpage "https://ffmpeg.org"
src_url "https://ffmpeg.org/releases/ffmpeg-4.2.3.tar.xz"
src_sum "9df6c90aed1337634c1fb026fb01c154c29c82a64ea71291ff2da9aacb9aad31"
depends "sdl2 opus libwebp libvorbis libtheora speex x264 x265 lame"

prepare() {
    sed_in_place 's/$_cc -v/$_cc --version/g' configure &&
    sed_in_place 's/cpuflags="-mcpu=$cpu"/[ -z "$cpu" ] || cpuflags="-mcpu=$cpu"/g' configure
}

build_in_sourced

build() {
    ./configure \
        --prefix="$ABI_INSTALL_DIR" \
        --sysroot="$SYSROOT" \
        --ar="$AR" \
        --as="$AS" \
        --cc="$CC" \
        --cxx="$CXX" \
        --nm="$NM" \
        --ranlib="$RANLIB" \
        --strip="$STRIP" \
        --arch="$BUILD_FOR_ARCH" \
        --target-os=darwin \
        --enable-cross-compile \
        --enable-pic \
        --enable-static \
        --disable-shared \
        --disable-debug \
        --disable-asm \
        --disable-doc \
        --disable-programs &&
    $MAKE clean &&
    $MAKE install &&
    cp ffbuild/config.log "$BUILD_DIR"
}