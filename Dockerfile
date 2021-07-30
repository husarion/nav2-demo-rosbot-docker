# Creating the ROS image ...

FROM ros:eloquent-ros-base-bionic

SHELL ["/bin/bash", "-c"]

RUN apt update && apt install -y \
    python3-pip \
    ros-eloquent-slam-toolbox \
    ros-eloquent-navigation2 \
    ros-eloquent-gazebo-ros-pkgs

RUN apt upgrade -y 

RUN apt remove -y google-mock  googletest

RUN mkdir -p /ros2_ws/src && \ 
    cd /ros2_ws && \
    colcon build --symlink-install --merge-install

RUN git clone --single-branch --branch eloquent https://github.com/husarion/rosbot_description.git ros2_ws/src/rosbot_description

RUN cd /ros2_ws && \
    rosdep update && \
    rosdep install --from-paths src --ignore-src -r -y

RUN cd /ros2_ws && \
    source /opt/ros/eloquent/setup.bash && \
    colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=Release --cmake-args -DBUILD_TESTING=OFF --merge-install

COPY ./ros_entrypoint.sh /

ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["bash"]
