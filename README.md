# DOCKER and ROS2 humble | Lidar STL-06

This is a docker project template to work with ROS2 humble and the Lidar STL-06 sensor. This project uses the [ldlidar_stl_ros2](https://github.com/ldrobotSensorTeam/ldlidar_stl_ros2) package to work with the Lidar STL-06 sensor.

Please follow the instructions to build the docker image and run the container.

## Get submodules
~~~bash
git submodule update --init --recursive
~~~

## Build the docker image
~~~bash
./scripts/build.sh
~~~

## Run the docker container
~~~bash
./scripts/run.sh
~~~

## Run the docker container with UI
~~~bash
./scripts/run_x11.sh
~~~

## Run the lidar node only
~~~bash
ros2 launch ldlidar_stl_ros2 ld06.launch.py
~~~

## Run the lidar node and rviz (requires X11)
~~~bash
ros2 launch ldlidar_stl_ros2 viewer_ld06.launch.py
~~~

## License
MIT

Autor: [Alejandro Daniel Jose Gomez Florez](https://www.linkedin.com/in/aldajo92/)
