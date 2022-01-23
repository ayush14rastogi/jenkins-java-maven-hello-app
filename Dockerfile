FROM openjdk:8-jre-alpine

EXPOSE 8080

COPY ./target/java-maven-app-*.jar /usr/app/
WORKDIR /usr/app
MAINTAINER "arsunnyrock288@gmail.com" 
CMD java -jar java-maven-app-*.jar
