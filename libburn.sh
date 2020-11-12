summary="Library for writing preformatted data onto optical media: CD, DVD and BD (Blu-Ray)"
homepage="https://www.libburnia-project.org"
url="http://files.libburnia-project.org/releases/libburn-1.5.2.tar.gz"
sha256="7b32db1719d7f6516cce82a9d00dfddfb3581725db732ea87d41ea8ef0ce5227"

prepare() {
    sed_in_place 's/-lpthread//g' configure
}

build() {
    configure
}
