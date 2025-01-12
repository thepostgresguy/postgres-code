FROM python:3.13.1-bullseye
USER root
RUN apt update && apt upgrade -y
RUN apt install default-jre default-jdk git -y
RUN apt install sudo vim -y
RUN useradd -ms /bin/bash jenkins
RUN usermod -aG sudo jenkins
RUN echo "jenkins ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER jenkins
