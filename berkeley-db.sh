summary "High performance key/value database"
webpage "https://www.oracle.com/database/berkeley-db"
src_url "https://fossies.org/linux/misc/db-18.1.40.tar.gz"
src_sum "0cecb2ef0c67b166de93732769abdeba0555086d51de1090df325e18ee8da9c8"
license "BSD 3-Clause"
bsystem "configure"
depends "openssl"
sourced "dist"

prepare() {
    sed_in_place 's| install_docs||' Makefile.in
}

build() {
    configure \
        --enable-cxx \
        --enable-stl \
        --enable-dbm \
        --enable-hash \
        --enable-compat185 \
        --enable-smallbuild
}
