#!/bin/bash
set -e

# setup ros environment
source "/opt/ros/eloquent/setup.bash"
source "/app/ros2_ws/install/setup.bash"

exec "$@"