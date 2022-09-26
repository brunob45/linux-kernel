#!/bin/bash

DOCKER_IMAGE=debian-gcc

case $1 in
build_image)
	docker build -t ${DOCKER_IMAGE} .
;;
run_image)
	docker run -it --rm ${DOCKER_IMAGE}
;;
build_kernel)
	docker run --rm -v $(pwd)/..:/root ${DOCKER_IMAGE} /bin/bash -c "cd linux-kernel && ./build.sh"
;;
*)
	echo "Invalid argument. Use build_image, run_image, build_kernel"
;;
esac
