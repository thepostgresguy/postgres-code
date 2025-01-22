FROM jenkins/inbound-agent:alpine as jnlp
FROM python:3.13.1-bullseye
USER root
RUN apt update && apt upgrade -y
RUN apt install default-jre default-jdk git -y
RUN apt install sudo vim -y
RUN useradd -ms /bin/bash jenkins
USER jenkins
RUN mkdir -p /home/jenkins/usr/bin
RUN echo "PATH=$PATH:/home/jenkins/usr/bin" >> ~/.shrc
USER root
COPY --from=jnlp /usr/local/bin/jenkins-agent /home/jenkins/usr/bin/jenkins-agent
COPY --from=jnlp /usr/share/jenkins/agent.jar /usr/share/jenkins/agent.jar
USER jenkins
RUN source ~/.shrc