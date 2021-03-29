summary "Library for interacting with JSON"
src_git "https://github.com/open-source-parsers/jsoncpp.git"
src_url "https://github.com/open-source-parsers/jsoncpp/archive/1.9.3.tar.gz"
src_sum "8593c1d69e703563d94d8c12244e2e18893eeb9a8a9f8aa3d09a327aa45c8f7d"
license "MIT"
bsystem "cmake"

build() {
    cmake \
        -DJSONCPP_WITH_EXAMPLE=OFF \
        -DJSONCPP_WITH_TESTS=OFF \
        -DJSONCPP_WITH_POST_BUILD_UNITTEST=OFF \
        -DJSONCPP_WITH_WARNING_AS_ERROR=OFF \
        -DJSONCPP_WITH_PKGCONFIG_SUPPORT=ON \
        -DJSONCPP_WITH_CMAKE_PACKAGE=ON \
        -DJSONCPP_USE_SECURE_MEMORY=ON \
        -DJSONCPP_WITH_STRICT_ISO=ON
}
