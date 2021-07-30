# nav2-demo-rosbot-docker
Dockerized ROSbot + Nav2 demo: https://husarion.com/tutorials/ros2-tutorials/rosbot-ros2-demo/

`docker-compose.yml` should start, the following containers:

1. From DockerHub:
- [rosbot-docker](https://github.com/husarion/rosbot-docker)
- [rplidar-docker](https://github.com/husarion/rplidar-docker)
- [astra-docker](https://github.com/husarion/astra-docker)
- [eloquent-ros1-bridge](https://hub.docker.com/layers/arm32v7/ros/eloquent-ros1-bridge/images/sha256-91f7ae4d4178f80763d5752abc117c0d88e50b5cee5c7e6a90fdfd8deede116f?context=explore)

2. Custom Docker Container:
- **nav2-demo-rosbot** based on [eloquent-ros-base-bionic](https://hub.docker.com/layers/arm32v7/ros/eloquent-ros-base-bionic/images/sha256-87ecf009416b573672574b25537f6f81bf6fcc9ca762a6f5c7a35ad0aa3f18b8?context=explore)

> Note that we use `eloquent-...` images instead of `foxy-...` images becasue ROS2 Foxy doesn't work on ARM32 architecture (no officail docker images).

## RUN Demo

To run use docker-compose 

```bash
cd examples/rosbot_pro_nav2_demo
docker-compose up
```

or foxy version (other dockerfile and ros_entrypoint)

```bash
cd examples/rosbot_pro_nav2_foxy
docker-compose up
```

## KNOWN ERRORS

When running foxy version (dockerfile and ros_entrypoint inside directory)

```bash
cd examples/rosbot_pro_nav2_foxy
docker-compose up
```

Rosbot launches correctly but lidar tf was in other direction (rotated around Z axis) I tried to change this at https://github.com/husarion/rosbot_description/blob/master/src/rosbot_description/launch/rosbot_docker.launch , but had no time to check if this works. Other error is that on eloquent version nav2 sometimes got errors when new goal arrives. 