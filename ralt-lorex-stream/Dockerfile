# syntax=docker/dockerfile:1

# Starting with ROS Melodic
FROM ros:melodic-ros-base

# Update packages
RUN apt-get update
RUN apt-get install -y python-catkin-tools
RUN apt-get install -y build-essential 
RUN apt-get install git
RUN apt update
RUN apt-get install -y ros-melodic-cv-bridge ros-melodic-image-transport ros-melodic-compressed-image-transport ros-melodic-camera-info-manager

# Download our dependencies from GitHub, CACHE_DATE arg can be used to prevent Git caching (e.g. docker-compose up --build-arg CACHE_DATE=now)
WORKDIR /home/root/Downloads
ARG CACHE_DATE=2021-08-11
RUN git clone https://github.com/care-group/RALT-Signalman-Container-Deps.git
WORKDIR /home/root/Downloads/RALT-Signalman-Container-Deps

# Create the catkin workspace directories
RUN mkdir /home/root/catkin_ws
RUN mkdir /home/root/catkin_ws/src

# Move the ROS dependencies into place
RUN mv video_stream_opencv /home/root/catkin_ws/src/

# Initialise catkin workspace and catkin_make
RUN . /opt/ros/melodic/setup.sh && catkin_init_workspace /home/root/catkin_ws/src
RUN . /opt/ros/melodic/setup.sh && cd /home/root/catkin_ws && catkin_make

# Copy in the entrypoint script and make it executable
COPY ralt-lorex-stream/start.sh /home/root/
RUN chmod +x /home/root/start.sh