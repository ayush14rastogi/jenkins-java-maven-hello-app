# Pull base image 
From tomcat:8-jre8

# Maintainer 
MAINTAINER "arsunnyrock288@gmail.com" 
COPY ./webapp.war /usr/local/tomcat/webapps

