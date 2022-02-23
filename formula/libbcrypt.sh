package set summary "a password hashing method based on the Blowfish block cipher, provided via the crypt(3) and a reentrant interface."
package set webpage "https://www.openwall.com/crypt"
package set git.url "https://github.com/leleliu008/libbcrypt.git"
package set bsystem "cmake"

build() {
    cmakew -DBUILD_ASM=OFF
}
