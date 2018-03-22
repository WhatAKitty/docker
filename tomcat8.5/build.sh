#!/bin/sh

export DOCKER_TAG="whatakitty/tomcat:8.5"

../build.sh "$1" $DOCKER_TAG
