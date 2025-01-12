FROM python:3.14.0a2-bullseye
USER root
RUN apt update && apt upgrade -y
RUN apt install default-jre default-jdk git -y
