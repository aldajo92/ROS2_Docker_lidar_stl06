#!/bin/bash

set -e

# Source the environment variables from config_docker.sh
PROJECT_ROOT="$(cd "$(dirname "$0")"; cd ..; pwd)"
source ${PROJECT_ROOT}/config_docker.sh

# Export the variables so docker-compose can use them
export DOCKER_IMAGE_NAME
export DOCKER_CONTAINER_NAME
export DOCKER_NETWORK

# Run docker-compose
docker-compose -f ${PROJECT_ROOT}/docker-compose.yml up
