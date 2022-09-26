#!/bin/sh

docker run --rm -v $(pwd)/..:/root debian-gcc /bin/bash -c "cd linux-kernel && ./build.sh"
