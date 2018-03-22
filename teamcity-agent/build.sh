#!/bin/sh

export DOCKER_TAG="whatakitty/teamcity-agent:1.0"

../build.sh "$1" $DOCKER_TAG
