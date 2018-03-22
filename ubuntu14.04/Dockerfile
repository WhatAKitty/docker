FROM ubuntu:14.04

MAINTAINER WhatAKitty 104xuqiang@gmail.com

ENV TEMP_PATH "/tmp/os"

# TEMP DIRECTORY
RUN mkdir -p "${TEMP_PATH}"

COPY sources.list.163 "${TEMP_PATH}/sources.list.163"

RUN set -x \
    && mv                    /etc/apt/sources.list /etc/apt/sources.list.back \
    && cp                    "${TEMP_PATH}/sources.list.163" /etc/apt/sources.list \
    && apt-get update --quiet \
    && apt-get install -y software-properties-common \
    && apt-get install -y systemd-services \
    && apt-get update --quiet

WORKDIR ~

COPY "docker-entrypoint.sh" "/"
ENTRYPOINT ["/docker-entrypoint.sh"]
