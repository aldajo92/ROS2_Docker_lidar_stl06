#!/bin/bash

set -e

PROJECT_ROOT="$(cd "$(dirname "$0")"; cd ..; pwd)"
source ${PROJECT_ROOT}/config_docker.sh

## get from registry $DOCKER_REGISTRY_ADDR
docker pull ${DOCKER_REGISTRY_ADDR}/${DOCKER_IMAGE_NAME}
