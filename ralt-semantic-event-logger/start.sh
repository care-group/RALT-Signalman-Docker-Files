#!/bin/bash
. /opt/ros/melodic/setup.sh && cd /home/root/catkin_ws && catkin_make
source /home/root/catkin_ws/devel/setup.bash
rosrun ralt_semantic_event_logger main.py