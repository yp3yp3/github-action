FROM maven:3.8.6-jdk-11-slim as build
WORKDIR /app
COPY . /app
RUN mvn clean test package

FROM openjdk:11-jre-slim
COPY --from=build /app/target/*.jar /app/
CMD  java -jar $(find /app -name 'my-app*.jar')

