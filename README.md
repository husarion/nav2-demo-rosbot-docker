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
