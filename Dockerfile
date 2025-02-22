FROM maven:3.8.6-openjdk-11 as build
RUN apt update && \ 
    git clone https://github.com/GOWTHI143/spring-petclinic.git && \
    cd spring-petclinic && \
    mvn package

FROM openjdk:11
LABEL project = spc
LABEL author = gowtham
EXPOSE 8080
COPY --from=build/spring-petclinic/target/spring-petclinic-2.7.3.jar / spring-petclinic-2.7.3.jar 
CMD ["java","-jar", "/spring-petclinic-2.7.3.jar"]