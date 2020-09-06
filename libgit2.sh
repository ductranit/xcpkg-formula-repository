summary="C library of Git core methods that is re-entrant and linkable"
homepage="https://libgit2.github.com"
url="https://github.com/libgit2/libgit2/releases/download/v1.0.1/libgit2-1.0.1.tar.gz"
sha256="689f442c39c4117df515d1a0ffd7b401b91a500d7e2875ac45a440d86f198f5a"
dependencies="openssl pcre2 libssh2"

build() {
    cmake \
    -DCMAKE_TOOLCHAIN_FILE="$CMAKE_TOOLCHAIN_FILE" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="$DIR_INSTALL_PREFIX" \
    -DCMAKE_PREFIX_PATH="$DIR_PKG" \
    -DCMAKE_FIND_ROOT_PATH="$DIR_PKG" \
    -DPKG_CONFIG_USE_CMAKE_PREFIX_PATH=True \
    -DBUILD_CLAR=OFF \
    -DBUILD_FUZZERS=OFF \
    -DBUILD_EXAMPLES=OFF \
    -DBUILD_SHARED_LIBS=ON \
    -DENABLE_WERROR=OFF \
    -DENABLE_TRACE=OFF \
    -DDEPRECATE_HARD=OFF \
    -DPROFILE=OFF \
    -DTHREADSAFE=ON \
    -DUSE_HTTPS=OpenSSL \
    -DUSE_SSH=ON \
    -DOPENSSL_INCLUDE_DIR="$openssl_DIR_INCLUDE" \
    -DOPENSSL_SSL_LIBRARY="$openssl_DIR_LIB/libssl.a" \
    -DOPENSSL_CRYPTO_LIBRARY="$openssl_DIR_LIB/libcrypto.a" \
    -DREGEX_BACKEND=pcre2 \
    -DPCRE2_INCLUDE_DIR="$pcre2_DIR_INCLUDE" \
    -DPCRE2_LIBRARY="$pcre2_DIR_LIB/libpcre2-8.a" \
    -DPCRE2_POSIX_LIBRARY="$pcre2_DIR_LIB/libpcre2-posix.a" \
    -G "Unix Makefiles" \
    -Wno-dev \
    -S . \
    -B "$DIR_BUILD" &&
    make --directory="$DIR_BUILD" -j$(nproc) install
}
