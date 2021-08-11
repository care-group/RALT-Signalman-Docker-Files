# syntax=docker/dockerfile:1
FROM ubuntu:focal
RUN apt-get update
RUN apt-get install -y git
RUN apt-get install -y python3-pip
ARG DEBIAN_FRONTEND=noninteractive
RUN apt install -y apache2
ENV APACHE_RUN_DIR /var/lib/apache/runtime
RUN mkdir -p ${APACHE_RUN_DIR}
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
WORKDIR /home/root
RUN mkdir Software
WORKDIR /home/root/Downloads
RUN git clone https://github.com/care-group/RALT-Custom-Sensor-Dashboard.git
WORKDIR /home/root/Downloads/RALT-Custom-Sensor-Dashboard
RUN mv client/* /var/www/html
RUN mv server /home/root/Software
WORKDIR /home/root/Software/server
RUN pip3 install -r requirements.txt
COPY start_server.sh /home/root/
RUN chmod +x /home/root/start_server.sh
CMD apachectl -D FOREGROUND