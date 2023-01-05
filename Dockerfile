FROM maven:3.8.6-openjdk-11 as build
RUN apt update && \ 
    git clone https://github.com/GOWTHI143/spring-petclinic.git && \
    cd spring-petclinic && \
    mvn package