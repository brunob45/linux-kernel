#!/bin/sh

GNU_VERSION=11.3.rel1

export ARCH=arm64
export CROSS_COMPILE=/opt/gcc-arm-${GNU_VERSION}/bin/aarch64-none-elf-

# build kernel
make radxa_zero_defconfig
make -j8

# package kernel
export build_id="$(date '+%Y%m%d%H%M')"
export lv="-${build_id}-amlogic"
export kv=$(make kernelversion)
export debv="${kv}${lv}"
make bindeb-pkg -j8 LOCALVERSION=$lv KDEB_PKGVERSION=$debv
