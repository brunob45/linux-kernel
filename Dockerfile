ARG BASE_IMAGE=ubuntu:latest

FROM $BASE_IMAGE

WORKDIR /root
RUN apt-get update && apt-get -y install wget xz-utils build-essential

# ENV GNU_VERSION=10.3-2021.07
ENV GNU_VERSION=11.3.rel1

# Check latest version here: https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads
ENV DOWNLOAD_PATH=https://developer.arm.com/-/media/Files/downloads/gnu/${GNU_VERSION}/binrel/arm-gnu-toolchain-${GNU_VERSION}-x86_64-aarch64-none-elf.tar.xz
ENV ARM_GCC_PATH=/opt/gcc-arm-${GNU_VERSION}

RUN \
	mkdir ${ARM_GCC_PATH} &&\
	wget -qO- ${DOWNLOAD_PATH} | tar -xvJ -C ${ARM_GCC_PATH} --strip-components=1


ENV PATH="${PATH}:${ARM_GCC_PATH}/bin:${ARM_GCC_PATH}/aarch64-none-elf/bin"

RUN apt-get update && apt-get -y install libncurses-dev flex bison bc rsync kmod cpio libssl-dev
