summary  "Perl compatible regular expressions library"
homepage "https://www.pcre.org"
url      "https://ftp.pcre.org/pub/pcre/pcre-8.44.tar.bz2"
sha256   "19108658b23b3ec5058edc9f66ac545ea19f9537234be1ec62b714c84399366d"
dependencies "bzip2"

build() {
    cmake \
    -DPCRE_BUILD_PCRE8=ON \
    -DPCRE_BUILD_PCRE16=ON \
    -DPCRE_BUILD_PCRE32=ON \
    -DPCRE_BUILD_PCREGREP=ON \
    -DPCRE_BUILD_PCRECPP=OFF \
    -DPCRE_BUILD_TESTS=OFF \
    -DPCRE_SUPPORT_VALGRIND=OFF \
    -DPCRE_SUPPORT_LIBZ=ON \
    -DPCRE_SUPPORT_LIBBZ2=ON \
    -DBZIP2_INCLUDE_DIR="$bzip2_INCLUDE_DIR" \
    -DBZIP2_LIBRARY_RELEASE="$bzip2_LIBRARY_DIR/libbz2.a" &&
    gen_pc_files
}

gen_pc_files() {
    install -d "$ABI_PKG_CONFIG_DIR"
    for item in pcre pcre16 pcre32 pcreposix
    do
        [ -f  "$ABI_PKG_CONFIG_DIR/lib$item.pc" ] && continue
        cat > "$ABI_PKG_CONFIG_DIR/lib$item.pc" <<EOF
prefix=$ABI_INSTALL_DIR
exec_prefix=\${prefix}
libdir=\${exec_prefix}/lib
includedir=\${prefix}/include

Name: lib$item
URL: http://www.pcre.org/
Description: PCRE - Perl compatible regular expressions C library with 8 bit character support
Version: $(version)
Libs: -L\${libdir} -l$item
Libs.private: -D_THREAD_SAFE -pthread
Cflags: -I\${includedir}
EOF
    done
}
