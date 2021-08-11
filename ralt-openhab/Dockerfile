# syntax=docker/dockerfile:1

# Starting with Ubuntu 20.04 Focal Fossa
FROM ubuntu:focal

# Update packages
RUN apt update

# Install essentials
RUN apt-get update -y
RUN apt-get install -y python3
RUN apt-get -q update

# Install Java SDK (Zulu)
RUN apt-get -yq install gnupg curl 
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0xB1998361219BD9C9
WORKDIR /home/root/Downloads
RUN curl -O https://cdn.azul.com/zulu/bin/zulu-repo_1.0.0-2_all.deb
RUN apt-get install -y ./zulu-repo_1.0.0-2_all.deb
RUN apt-get update
RUN apt-get install -y zulu11-jdk

# Install OpenHAB 3
RUN apt-get install -y wget
RUN wget -qO - 'https://openhab.jfrog.io/artifactory/api/gpg/key/public' | apt-key add -
RUN apt-get install -y apt-transport-https
RUN echo 'deb https://openhab.jfrog.io/artifactory/openhab-linuxpkg stable main' | tee /etc/apt/sources.list.d/openhab.list
RUN apt-get update
RUN apt-get install -y openhab
RUN apt-get install -y openhab-addons

# Download our dependencies from GitHub, the OpenHAB backup will be restored by the entrypoint script
RUN mkdir /home/root/Software
WORKDIR /home/root/Software
RUN apt-get install -y git
RUN git clone https://github.com/care-group/RALT-OpenHAB-Backup.git
WORKDIR /home/root/Software/RALT-OpenHAB-Backup

# Copy in the entrypoint script and make it executable
COPY start.sh /home/root/
RUN chmod +x /home/root/start.sh