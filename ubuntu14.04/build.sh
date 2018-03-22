#!/bin/sh

export DOCKER_TAG="whatakitty/ubuntu:14.04"

../build.sh "$1" $DOCKER_TAG
