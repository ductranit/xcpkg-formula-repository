summary "A modern, portable, easy to use crypto library."
webpage "https://libsodium.org"
src_git "https://github.com/jedisct1/libsodium.git"
src_url "https://download.libsodium.org/libsodium/releases/libsodium-1.0.18.tar.gz"
src_sum "6f504490b342a4f8a4c4a02fc9b866cbef8622d5df4e5452b46be121e46636c1"
license "ISC"
bsystem "configure"

# ld: targeted OS version does not support use of thread local variables in _randombytes_internal_random for architecture x86_64
