# syntax=docker/dockerfile:1

# Starting with ROS Noetic
FROM ros:noetic-ros-base

# Update packages
RUN apt-get update

# Install essentials
RUN apt-get install -y python3-catkin-tools
RUN apt-get install -y build-essential 
RUN apt-get install -y git
RUN apt-get install -y python3-pip
RUN apt-get install -y python3-tk 

# Download our dependencies from GitHub, CACHE_DATE arg can be used to prevent Git caching (e.g. docker-compose up --build-arg CACHE_DATE=now)
WORKDIR /home/root/Downloads
ARG CACHE_DATE=2021-08-11
RUN git clone https://github.com/ronsm/ronsm_robot_har_packages.git
RUN git clone https://github.com/ronsm/ronsm_messages.git
WORKDIR /home/root/Downloads/ronsm_robot_har_packages/robot_har_mln/src
RUN pip3 install colored tabulate portalocker
RUN pip3 install -r requirements.txt

# Create the catkin workspace directories
RUN mkdir /home/root/catkin_ws
RUN mkdir /home/root/catkin_ws/src

# Move the ROS dependencies into place
WORKDIR /home/root/Downloads/ronsm_robot_har_packages
RUN mv robot_har_mln /home/root/catkin_ws/src/
WORKDIR /home/root/Downloads/
RUN mv ronsm_messages /home/root/catkin_ws/src/

# Initialise catkin workspace and catkin_make
RUN . /opt/ros/noetic/setup.sh && catkin_init_workspace /home/root/catkin_ws/src
RUN . /opt/ros/noetic/setup.sh && cd /home/root/catkin_ws && catkin_make

# Copy in the entrypoint script and make it executable
COPY robot-har-mln/start.sh /home/root/
RUN chmod +x /home/root/start.sh
