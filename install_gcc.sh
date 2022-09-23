#!/bin/bash

# GNU_VERSION=10.3-2021.07
GNU_VERSION=11.3.rel1

DOWNLOAD_PATH=https://developer.arm.com/-/media/Files/downloads/gnu/${GNU_VERSION}/binrel/arm-gnu-toolchain-${GNU_VERSION}-x86_64-aarch64-none-elf.tar.xz

OUTPUT_PATH=/opt/gcc-arm-${GNU_VERSION}

mkdir ${OUTPUT_PATH}

wget -qO- ${DOWNLOAD_PATH} | tar -xvJ -C ${OUTPUT_PATH} --strip-components=1
