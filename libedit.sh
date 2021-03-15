summary "BSD-style licensed readline alternative"
webpage "https://thrysoee.dk/editline"
src_url "https://thrysoee.dk/editline/libedit-20191231-3.1.tar.gz"
src_sum "dbb82cb7e116a5f8025d35ef5b4f7d4a3cdd0a3909a146a39112095a2d229071"
bsystem "configure"
depends "ncurses"

build() {
    configure --disable-examples
}
