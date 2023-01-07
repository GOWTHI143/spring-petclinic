FROM openjdk:11
LABEL project = spc
LABEL author = gowtham
COPY /home/ubuntu/task/workspace/spc/targetspring-petclinic-2.7.3.jar .
EXPOSE 8080
CMD ["java","-jar", "/spring-petclinic-2.7.3.jar"]