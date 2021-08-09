# syntax=docker/dockerfile:1
FROM ros:melodic-ros-base
RUN apt-get update
RUN apt-get install -y python-catkin-tools
RUN apt-get install -y build-essential 
RUN apt-get install git
RUN apt-get install -y ros-melodic-cv-bridge ros-melodic-image-transport ros-melodic-camera-info-manager
WORKDIR /home/root/Downloads
ARG CACHEBUST=1 
RUN git clone https://github.com/care-group/RALT-Signalman-Container-Deps.git
WORKDIR /home/root/Downloads/RALT-Signalman-Container-Deps
RUN mkdir /home/root/catkin_ws
RUN mkdir /home/root/catkin_ws/src
RUN mv video_stream_opencv /home/root/catkin_ws/src/
RUN . /opt/ros/melodic/setup.sh && catkin_init_workspace /home/root/catkin_ws/src
RUN . /opt/ros/melodic/setup.sh && cd /home/root/catkin_ws && catkin_make
COPY start_stream.sh /home/root/
RUN chmod +x /home/root/start_stream.sh