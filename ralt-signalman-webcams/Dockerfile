# syntax=docker/dockerfile:1

# Starting with ROS Melodic
FROM ros:melodic-ros-base

# Update packages
RUN apt-get update

# Install essentials
RUN apt-get install -y python-catkin-tools
RUN apt-get install -y build-essential 
RUN apt-get install git
RUN apt-get install -y python-pip
RUN apt update

# Download our dependencies from GitHub, CACHE_DATE arg can be used to prevent Git caching (e.g. docker-compose up --build-arg CACHE_DATE=now)
WORKDIR /home/root/Downloads
ARG CACHE_DATE=2021-08-11
RUN git clone https://github.com/care-group/RALT-Signalman-Container-ROS-Deps.git
WORKDIR /home/root/Downloads/RALT-Signalman-Container-ROS-Deps/ralt_signalman_webcam
RUN pip3 install -r requirements.txt
WORKDIR /home/root/Downloads/RALT-Signalman-Container-ROS-Deps

# Create the catkin workspace directories
RUN mkdir /home/root/Software

# Move the dependencies into place
RUN mv ralt_signalman_webcam /home/root/Software/

# Copy in the entrypoint script and make it executable
COPY ralt-signalman-webcams/start.sh /home/root/
RUN chmod +x /home/root/start.sh
