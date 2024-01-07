FROM maven:3.8.6-jdk-11-slim as build
WORKDIR /app
COPY . /app
RUN mvn clean test package

FROM openjdk:11-jre-slim
COPY --from=build /app/target/my-app-1.0.0.jar /app/my-app-1.0.0.jar
CMD  java -jar /app/my-app-1.0.0.jar

