FROM openjdk:11
LABEL project = spc
LABEL author = gowtham
ADD https://gowtham143.jfrog.io/artifactory/gowtham-libs-release/org/springframework/samples/spring-petclinic/2.7.3/spring-petclinic-2.7.3.jar /
EXPOSE 8080
CMD ["java","-jar", "/spring-petclinic-2.7.3.jar"]
