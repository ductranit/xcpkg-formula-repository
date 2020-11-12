summary="C library for files containing sampled sound"
homepage="http://www.mega-nerd.com/libsndfile"
url="http://www.mega-nerd.com/libsndfile/files/libsndfile-1.0.28.tar.gz"
sha256="1ff33929f042fa333aed1e8923aa628c3ee9e1eb85512686c55092d1e5a9dfa9"
dependencies="libogg libvorbis flac sqlite"

prepare() {
    fetch_config_sub   Cfg &&
    fetch_config_guess Cfg
}

build() {
    configure \
        --disable-test-coverage \
        --disable-full-suite \
        --disable-octave \
        --enable-sqlite \
        --enable-external-libs
}
