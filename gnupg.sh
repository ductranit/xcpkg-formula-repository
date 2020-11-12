summary="GNU Pretty Good Privacy (PGP) package"
homepage="https://gnupg.org"
url="https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.2.23.tar.bz2"
sha256="10b55e49d78b3e49f1edb58d7541ecbdad92ddaeeb885b6f486ed23d1cd1da5c"
dependencies="libgpg-error libgcrypt libassuan libksba npth libiconv bzip2 readline"

prepare() {
    gen_c_file_stub_system &&
    sed_in_place "1i #include<$C_FILE_STUB_SYSTEM>" g10/exec.c &&
    sed_in_place 's/system(info->command)/stub_system(info->command)/g' g10/exec.c
}

build() {
    configure \
        --disable-assert \
        --disable-gcc-warnings \
        --enable-threads=posix \
        --with-included-regex \
        --with-gpg-error-prefix="$libgpg_error_INSTALL_DIR" \
        --with-libgcrypt-prefix="$libgcrypt_INSTALL_DIR" \
        --with-libassuan-prefix="$libassuan_INSTALL_DIR" \
        --with-ksba-prefix="$libksba_INSTALL_DIR" \
        --with-npth-prefix="$npth_INSTALL_DIR" \
        --with-bzip2="$bzip2_INSTALL_DIR" \
        --with-readline="$readline_INSTALL_DIR" \
        --with-libiconv-prefix="$libincov_INSTALL_DIR"
}
