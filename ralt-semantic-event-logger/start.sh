#!/bin/bash
. /opt/ros/melodic/setup.sh && cd /home/root/catkin_ws && catkin_make
source /home/root/catkin_ws/devel/setup.bash
#roscore &
sleep 5
rosrun ralt_semantic_event_logger main.py