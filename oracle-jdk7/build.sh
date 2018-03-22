#!/bin/sh

export DOCKER_TAG="whatakitty/oracle-jdk:7"

../build.sh "$1" $DOCKER_TAG
