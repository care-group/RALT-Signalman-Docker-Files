#!/bin/bash
export ROS_MASTER_URI=http://$(hostname --ip-address):11311
export ROS_HOSTNAME=$(hostname --ip-address)
. /opt/ros/melodic/setup.sh && cd /home/root/catkin_ws && catkin_make
source /home/root/catkin_ws/devel/setup.bash
sleep 2
rosrun ralt_semantic_event_logger main.py