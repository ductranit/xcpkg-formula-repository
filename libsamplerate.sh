summary  "Library for sample rate conversion of audio data"
homepage "http://www.mega-nerd.com/SRC"
url      "http://www.mega-nerd.com/SRC/libsamplerate-0.1.9.tar.gz"
sha256   "0a7eb168e2f21353fb6d84da152e4512126f7dc48ccb0be80578c565413444c1"
dependencies "libsndfile fftw"

prepare() {
    autoreconf -ivf &&
    sed_in_place '$d' autogen.sh && ./autogen.sh &&
    sed_in_place 's/(defined (__MACH__) && defined (__APPLE__))/0/g' examples/audio_out.c
}

build() {
    configure \
        --enable-sndfile \
        --enable-fftw
}
