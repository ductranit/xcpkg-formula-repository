summary "Core application library for C"
webpage "https://developer.gnome.org/glib"
src_url "https://download.gnome.org/sources/glib/2.66/glib-2.66.0.tar.xz"
src_sum "c5a66bf143065648c135da4c943d2ac23cce15690fc91c358013b2889111156c"
license "LGPL-2.1-or-later"
bsystem "meson"
depends "gettext libffi pcre"

prepare() {
    sed_in_place '/build_tests =/a build_tests = false' meson.build &&
    sed_in_place 's|error (|message (|g' glib/gnulib/meson.build
}

build() {
    meson \
        -Dnls=disabled \
        -Dman=false \
        -Dgtk_doc=false \
        -Diconv=external \
        -Ddtrace=false \
        -Dinternal_pcre=false \
        -Dinstalled_tests=false \
        -Dbsymbolic_functions=false
}

build_configed() {
    sed_in_place "s|MacOSX$(xcrun --sdk macosx --show-sdk-version)|$TARGET_OS_NAME|g" build.ninja &&
    sed_in_place "s|MacOSX|$TARGET_OS_NAME|g"      build.ninja 
}
