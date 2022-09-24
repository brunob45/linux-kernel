#!/bin/bash

export DISTRO=$1

docker build -t $1-gcc .
