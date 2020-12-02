summary  "Utility for directing compilation"
homepage "https://www.gnu.org/software/make"
url      "https://ftp.gnu.org/gnu/make/make-4.3.tar.gz"
sha256   "e05fdde47c5f7ca45cb697e973894ff4f5d79e13b750ed57d7b66d8defc78e19"
license  "GPL-3.0"

prepare() {
    sed_in_place '/sigsetmask (siggetmask (0) & ~fatal_signal_mask)/a ;' src/job.c &&
    sed_in_place 's/__ANDROID__/__APPLE__/' src/arscan.c
}

build() {
    configure \
        --without-guile \
        --without-dmalloc \
        ac_cv_func_sigsetmask=no
}
