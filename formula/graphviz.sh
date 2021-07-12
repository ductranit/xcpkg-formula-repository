package set summary "Graph visualization software from AT&T and Bell Labs"
package set webpage "https://www.graphviz.org"
package set src.url "https://www2.graphviz.org/Packages/stable/portable_source/graphviz-2.44.1.tar.gz"
package set src.sum "8e1b34763254935243ccdb83c6ce108f531876d7a5dfd443f255e6418b8ea313"
package set license "EPL-1.0"
package set bsystem "autotools"
package set dep.cmd "pkg-config libtoolize libtool groff ps2pdf"
package set dep.pkg "fontconfig libpng expat"

prepare() {
    sed_in_place 's|install-exec-hook|xxxxxxxxxxxx|' cmd/dot/Makefile.am &&
    autoreconf -ivf &&
    inject_stub_system lib/sparse/general.c lib/common/utils.c lib/gvpr/compile.c contrib/diffimg/diffimg.c
}

build() {
    export HOSTCC="$CC_FOR_BUILD"
    configure --enable-swig=no
}
