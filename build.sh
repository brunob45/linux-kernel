#!/bin/sh

# exit when any command fails
set -e

export ARCH=arm64
export CROSS_COMPILE=${ARM_GCC_PATH}/bin/aarch64-none-elf-

# export KBUILD_OUTPUT=/tmp/linux

# build kernel
make radxa_zero_defconfig
make -j8

# package kernel
export build_id="$(date '+%Y%m%d%H%M')"
export lv="-${build_id}-amlogic"
export kv=$(make kernelversion)
export debv="${kv}${lv}"
make bindeb-pkg -j8 LOCALVERSION=$lv KDEB_PKGVERSION=$debv
