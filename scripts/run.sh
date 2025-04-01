#!/bin/bash

set -e

PROJECT_ROOT="$(cd "$(dirname "$0")"; cd ..; pwd)"
source ${PROJECT_ROOT}/config_docker.sh

docker run -it \
  --name=${DOCKER_CONTAINER_NAME} \
  --network ${ROS_NETWORK} \
  --volume ${PROJECT_ROOT}/ros2_ws:/ros2_ws \
  --volume /dev/:/dev \
  --volume /run/udev:/run/udev \
  --device=/dev/ttyUSB0:/dev/ttyUSB0 \
  --rm \
  -e ROS_DOMAIN_ID=0 \
  ${DOCKER_IMAGE_NAME} /bin/bash -c "source /ros2_ws/install/setup.bash && ros2 launch ldlidar_stl_ros2 ld06.launch.py"

# docker run -it \
#   --name=${DOCKER_CONTAINER_NAME} \
#   --network ${ROS_NETWORK} \
#   --volume /dev/:/dev \
#   --volume /run/udev:/run/udev \
#   --device=/dev/ttyUSB0:/dev/ttyUSB0 \
#   --rm \
#   -e ROS_DOMAIN_ID=0 \
#   ${DOCKER_IMAGE_NAME} /bin/bash
