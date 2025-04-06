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

## License
MIT

Autor: [Alejandro Daniel Jose Gomez Florez](https://www.linkedin.com/in/aldajo92/)
