#!/bin/sh

docker run --rm -v $(pwd):/root/linux debian-gcc /bin/bash -c "cd /root/linux && ./build.sh"
