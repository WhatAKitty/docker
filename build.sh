#!/bin/sh

function build() {
  docker build -t $DOCKER_TAG .
}

function push() {
  build

  ../docker-client.sh

  docker tag $DOCKER_TAG $DOCKER_TAG
  docker push $DOCKER_TAG
}

case "$1" in
  push)
    push
    ;;
  *)
    build
    ;;
esac
