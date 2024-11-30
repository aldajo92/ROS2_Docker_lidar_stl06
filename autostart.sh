#!/bin/bash

source /opt/ros/$ROS_DISTRO/setup.bash

cd /ros2_ws && colcon build

source /ros2_ws/install/setup.bash --

exec "$@"
