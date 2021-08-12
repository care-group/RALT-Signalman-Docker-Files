# syntax=docker/dockerfile:1

# Starting with Ubuntu 20.04 Focal Fossa
FROM ubuntu:focal

# Update packages
RUN apt-get update

# Disable interactive shell, Apache2 install hangs otherwise
ARG DEBIAN_FRONTEND=noninteractive

# Install essentials
RUN apt-get install -y git
RUN apt-get install -y python3-pip
RUN apt install -y apache2

# Set up Apache2
ENV APACHE_RUN_DIR /var/lib/apache/runtime
RUN mkdir -p ${APACHE_RUN_DIR}
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

# Download our dependencies from GitHub
WORKDIR /home/root
RUN mkdir Software
WORKDIR /home/root/Downloads
ARG CACHE_DATE=2021-08-11
RUN git clone https://github.com/care-group/RALT-Custom-Sensor-Dashboard.git

# Move the dependencies into place
WORKDIR /home/root/Downloads/RALT-Custom-Sensor-Dashboard
RUN mv client/* /var/www/html
RUN mv server /home/root/Software
WORKDIR /home/root/Software/server

# Install Python package dependencies
RUN pip3 install -r requirements.txt

# Copy in the entrypoint script and make it executable
COPY ralt-signalman-dashboard/start.sh /home/root/
RUN chmod +x /home/root/start.sh

# Set the Apache2 process to run in the foreground, preventing the container from exiting
CMD apachectl -D FOREGROUND