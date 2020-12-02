summary  "New GNU portable threads library"
homepage "https://gnupg.org"
url      "https://gnupg.org/ftp/gcrypt/npth/npth-1.6.tar.bz2"
sha256   "1393abd9adcf0762d34798dc34fdcf4d0d22a8410721e76f1e3afcd1daa4e2d1"
license  "LGPL-2.1"

prepare() {
    inject_stub_system src/npth.c
}

build() {
    configure --disable-tests
}
