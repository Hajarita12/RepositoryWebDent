FROM maven:3.8.4-openjdk-17 AS builder  
WORKDIR /app  
COPY ./src ./src  
COPY ./pom.xml .  

FROM openjdk:17-jdk-alpine  
VOLUME /tmp  
ARG JAR_FILE=/app/target/*.jar 
COPY target/*.jar app.jar  
ENTRYPOINT ["java","-jar","/app.jar"]