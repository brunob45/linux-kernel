#!/bin/bash

DOCKER_BASE=${2:-"ubuntu"} # by default, use ubuntu
DOCKER_IMAGE=${DOCKER_BASE}-gcc

case $1 in
build_image)
	docker build -t ${DOCKER_IMAGE} --build-arg BASE_IMAGE="${DOCKER_BASE}:latest" .
;;
run_image)
	docker run -it --rm -v $(pwd)/..:/root ${DOCKER_IMAGE}
;;
build_kernel)
	docker run --rm -v $(pwd)/..:/root ${DOCKER_IMAGE} /bin/bash -c "cd linux-kernel && ./build.sh"
;;
*)
	echo "Invalid argument. Use build_image, run_image, build_kernel"
;;
esac
