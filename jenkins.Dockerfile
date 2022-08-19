FROM jenkins/jenkins:alpine
LABEL maintainer="ames"

COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/plugins.txt
EXPOSE 8080