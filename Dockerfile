FROM ros:humble-ros-base-jammy
ENV ROS_DISTRO humble

RUN apt update && apt install -y \
    python3-rosinstall \
    git \
    nano \
    tmux \
    wget \
    curl \
    iputils-ping \
    net-tools

RUN apt update && apt install -y \
    libeigen3-dev

RUN sudo apt update && apt install -y \
    python3-shapely \
    python3-yaml \
    python3-requests \
    python3-colcon-clean \
    python3-pip \
    python3-rosdep \
    python3-vcstool \
    python3-colcon-common-extensions

RUN apt update && apt install -y \
    ros-${ROS_DISTRO}-rviz2

RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
RUN echo "alias sros2='source /opt/ros/humble/setup.bash && source /ros2_ws/install/setup.bash'" >> ~/.bashrc
RUN echo "alias bros2='cd /ros2_ws && source /opt/ros/humble/setup.bash && colcon build'" >> ~/.bashrc

ENTRYPOINT [ "/ros_entrypoint.sh" ]
