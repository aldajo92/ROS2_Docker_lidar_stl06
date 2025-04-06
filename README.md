# DOCKER and ROS2 humble | Waveshare Rover

This repository contains a Dockerfile and scripts to build and run a Docker container with ROS2 Humble and the Waveshare Rover.

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

## Publish to Docker Registry
~~~bash
./scripts/publish.sh --localhost
~~~

## Get from Docker Registry
~~~bash
docker pull <hostame>:<port>/waver_image
~~~

## License
MIT

Autor: [Alejandro Daniel Jose Gomez Florez](https://www.linkedin.com/in/aldajo92/)
