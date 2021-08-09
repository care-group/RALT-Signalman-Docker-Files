#!/bin/bash
. /opt/ros/melodic/setup.sh && cd /home/root/catkin_ws && catkin_make
source /home/root/catkin_ws/devel/setup.bash
roslaunch video_stream_opencv all_cameras.launch