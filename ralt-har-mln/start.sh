#!/bin/bash
# export ROS_MASTER_URI=http://$(hostname --ip-address):11311
echo "192.168.1.9 tiago-23c" >> /etc/hosts
export ROS_MASTER_URI=http://192.168.1.9:11311
export ROS_IP=192.168.1.130
. /opt/ros/melodic/setup.sh && cd /home/root/catkin_ws && catkin_make
source /home/root/catkin_ws/devel/setup.bash
sleep 2
rosrun ralt_har_mln main.py
