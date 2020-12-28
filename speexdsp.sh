summary "Speex audio processing library"
webpage "https://github.com/xiph/speexdsp"
src_url "https://github.com/xiph/speexdsp/archive/SpeexDSP-1.2.0.tar.gz"
src_sum "d7032f607e8913c019b190c2bccc36ea73fc36718ee38b5cdfc4e4c0a04ce9a4"

prepare() {
    ./autogen.sh
}

build() {
    configure
}
