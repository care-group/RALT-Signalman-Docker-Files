# syntax=docker/dockerfile:1

# Starting with ROS Melodic
FROM ros:noetic-ros-base

# Update packages
RUN apt-get update

# Install essentials
RUN apt-get install -y python3-catkin-tools
RUN apt-get install -y build-essential 
RUN apt-get install -y git
RUN apt-get install -y python3-pip

# Download our dependencies from GitHub, CACHE_DATE arg can be used to prevent Git caching (e.g. docker-compose up --build-arg CACHE_DATE=now)
WORKDIR /home/root/Downloads
ARG CACHE_DATE=2021-08-11
RUN git clone https://github.com/care-group/RALT-Signalman-Container-ROS-Deps.git
WORKDIR /home/root/Downloads/RALT-Signalman-Container-ROS-Deps/ralt_har_mln_basic/src
RUN pip3 install -r requirements.txt
WORKDIR /home/root/Downloads/RALT-Signalman-Container-ROS-Deps

# Create the catkin workspace directories
RUN mkdir /home/root/catkin_ws
RUN mkdir /home/root/catkin_ws/src

# Move the ROS dependencies into place
RUN mv ralt_har_mln_basic /home/root/catkin_ws/src/

# Initialise catkin workspace and catkin_make
RUN . /opt/ros/melodic/setup.sh && catkin_init_workspace /home/root/catkin_ws/src
RUN . /opt/ros/melodic/setup.sh && cd /home/root/catkin_ws && catkin_make

# Copy in the entrypoint script and make it executable
COPY ralt-har-mln/start.sh /home/root/
RUN chmod +x /home/root/start.sh