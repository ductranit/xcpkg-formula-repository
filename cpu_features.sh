summary  "Cross platform C99 library to get cpu features at runtime"
homepage "https://github.com/google/cpu_features"
url      "https://github.com/google/cpu_features/archive/v0.5.0.tar.gz"
sha256   "b967811cecd68412e0dc65e4964756a6ae48755456fa2c2f42034f6271ac2c27"
license  "Apache-2.0"

prepare() {
    sed_in_place 's/\^arm/\^armv7/'               CMakeLists.txt &&
    sed_in_place 's/\^aarch64/\^(aarch64|arm64)/' CMakeLists.txt
}

build() {
    cmake -DBUILD_PIC=ON
}
