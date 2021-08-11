# syntax=docker/dockerfile:1
FROM ros:melodic-ros-base
RUN apt-get update
RUN apt-get install -y python-catkin-tools
RUN apt-get install -y build-essential 
RUN apt-get install git
RUN apt-get install -y python3-pip
RUN apt-get install -y python-pip
WORKDIR /home/sandbox/shared
WORKDIR /home/root/Downloads
ARG CACHE_DATE=2016-01-02
RUN git clone https://github.com/care-group/RALT-Signalman-Container-ROS-Deps.git
WORKDIR /home/root/Downloads/RALT-Signalman-Container-ROS-Deps/ralt_semantic_event_logger/src
RUN pip install -r requirements.txt
WORKDIR /home/root/Downloads/RALT-Signalman-Container-ROS-Deps
RUN mkdir /home/root/catkin_ws
RUN mkdir /home/root/catkin_ws/src
RUN mv ralt_semantic_event_logger /home/root/catkin_ws/src/
RUN . /opt/ros/melodic/setup.sh && catkin_init_workspace /home/root/catkin_ws/src
RUN . /opt/ros/melodic/setup.sh && cd /home/root/catkin_ws && catkin_make
COPY start.sh /home/root/
RUN chmod +x /home/root/start.sh