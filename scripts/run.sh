#!/bin/bash

set -e

PROJECT_ROOT="$(cd "$(dirname "$0")"; cd ..; pwd)"
source ${PROJECT_ROOT}/config_docker.sh

docker run -it \
  --privileged \
  -e DISPLAY \
  -e TERM \
  -e QT_X11_NO_MITSHM=1 \
  -e XAUTHORITY \
  -e ROS_DOMAIN_ID=0 \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v $XAUTHORITY:$XAUTHORITY \
  --name=${DOCKER_CONTAINER_NAME} \
  --network ${DOCKER_NETWORK} \
  --volume ${PROJECT_ROOT}/ros2_ws:/ros2_ws \
  --volume /dev/:/dev \
  --volume /run/udev:/run/udev \
  --rm \
  ${DOCKER_IMAGE_NAME} /bin/bash
