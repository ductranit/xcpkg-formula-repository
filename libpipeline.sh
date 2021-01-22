summary "Library for manipulating pipelines of subprocesses in a flexible and convenient way"
webpage "http://libpipeline.nongnu.org"
src_url "http://download.savannah.nongnu.org/releases/libpipeline/libpipeline-1.5.2.tar.gz"
src_sum "fd59c649c1ae9d67604d1644f116ad4d297eaa66f838e3dfab96b41e85b059fb"

build() {
    configure \
        --enable-threads=posix \
        --enable-socketpair-pipe
}