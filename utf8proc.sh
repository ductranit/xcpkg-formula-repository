summary  "Clean C library for processing UTF-8 Unicode data"
homepage "https://juliastrings.github.io/utf8proc"
url      "https://github.com/JuliaStrings/utf8proc/archive/v2.5.0.tar.gz"
sha256   "d4e8dfc898cfd062493cb7f42d95d70ccdd3a4cd4d90bec0c71b47cca688f1be"
license  "MIT"

build() {
    cmake \
        -DUTF8PROC_INSTALL=ON \
        -DUTF8PROC_ENABLE_TESTING=OFF
}
