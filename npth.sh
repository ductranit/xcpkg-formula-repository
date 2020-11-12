summary="New GNU portable threads library"
homepage="https://gnupg.org"
url="https://gnupg.org/ftp/gcrypt/npth/npth-1.6.tar.bz2"
sha256="1393abd9adcf0762d34798dc34fdcf4d0d22a8410721e76f1e3afcd1daa4e2d1"
license="LGPL-2.1"

prepare() {
    gen_c_file_stub_system &&
    sed_in_place "1i #include<$C_FILE_STUB_SYSTEM>" src/npth.c &&
    sed_in_place 's/system(cmd)/stub_system(cmd)/g' src/npth.c
}

build() {
    configure --disable-tests
}
