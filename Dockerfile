FROM openjdk:11-jre-slim

WORKDIR home/janardhan/node

COPY pom.xml .

COPY src ./src

RUN apt-get update && apt-get install -y maven
RUN mvn clean package

COPY target/*.jar node.jar

CMD ["java", "-jar", "app.jar"]

