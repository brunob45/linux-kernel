FROM debian:latest

WORKDIR /root
RUN apt-get update && apt-get -y install wget xz-utils build-essential

# ENV GNU_VERSION=10.3-2021.07
ENV GNU_VERSION=11.3.rel1

ENV DOWNLOAD_PATH=https://developer.arm.com/-/media/Files/downloads/gnu/${GNU_VERSION}/binrel/arm-gnu-toolchain-${GNU_VERSION}-x86_64-aarch64-none-elf.tar.xz
ENV OUTPUT_PATH=/opt/gcc-arm-${GNU_VERSION}

RUN \
	mkdir ${OUTPUT_PATH} &&\
	wget -qO- ${DOWNLOAD_PATH} | tar -xvJ -C ${OUTPUT_PATH} --strip-components=1


ENV PATH="${PATH}:${OUTPUT_PATH}/bin:${OUTPUT_PATH}/aarch64-none-elf/bin"

RUN apt-get update && apt-get -y install bc rsync kmod cpio bison flex libssl-dev
