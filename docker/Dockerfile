FROM debian:latest

ENV PATH="${PATH}:/opt/gcc-arm-11.3.rel1/bin:/opt/gcc-arm-11.3.rel1/aarch64-none-elf/bin"

WORKDIR /root

COPY install_gcc.sh install_gcc.sh

RUN apt-get update && apt-get -y install wget xz-utils
RUN sh install_gcc.sh

RUN apt-get update && apt-get -y install make

