#!/bin/bash
#export ROS_MASTER_URI=http://$(hostname --ip-address):11311
echo $ROS_MASTER_IP $ROS_MASTER_HOSTNAME >> /etc/hosts
. /opt/ros/melodic/setup.sh && cd /home/root/catkin_ws && catkin_make
source /home/root/catkin_ws/devel/setup.bash
sleep 10
rosrun ralt_apple_watch_publisher apple_watch_publisher.py
