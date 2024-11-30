#!/bin/bash

set -e

PROJECT_ROOT="$(cd "$(dirname "$0")"; cd ..; pwd)"
source ${PROJECT_ROOT}/config_docker.sh
source ${PROJECT_ROOT}/config_local.sh

docker run -it \
  --privileged \
  -e DISPLAY \
  -e TERM \
  -e QT_X11_NO_MITSHM=1 \
  -e XAUTHORITY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v $XAUTHORITY:$XAUTHORITY \
  --name=${DOCKER_CONTAINER_NAME} \
  --network ${ROS_NETWORK} \
  --volume ${PROJECT_ROOT}/ros2_ws:/ros2_ws \
  --device=/dev/ttyUSB0:/dev/ttyUSB0 \
  --rm \
  ${DOCKER_IMAGE_NAME} /bin/bash
