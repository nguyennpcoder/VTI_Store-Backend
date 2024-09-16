FROM maven:3.8.6-eclipse-temurin-17 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM amazoncorretto:17-alpine3.17
COPY --from=build /target/shopapp-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8884
ENTRYPOINT ["java","-jar","app.jar"]