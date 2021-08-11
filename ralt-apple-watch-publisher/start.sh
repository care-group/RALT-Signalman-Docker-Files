#!/bin/bash
. /opt/ros/melodic/setup.sh && cd /home/root/catkin_ws && catkin_make
source /home/root/catkin_ws/devel/setup.bash
rosrun apple_watch_publisher apple_watch_publisher.py