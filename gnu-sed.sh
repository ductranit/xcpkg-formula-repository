summary="GNU implementation of the famous stream editor"
homepage="https://www.gnu.org/software/sed"
url="https://ftp.gnu.org/gnu/sed/sed-4.8.tar.xz"
sha256="f79b0cfea71b37a8eeec8490db6c5f7ae7719c35587f21edb0617f370eeff633"
license="GPL-3.0"

build() {
    configure \
        --without-selinux \
        --with-included-regex \
        --disable-acl \
        --disable-assert \
        --disable-gcc-warnings
}
