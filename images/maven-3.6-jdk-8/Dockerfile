FROM maven:3.6-jdk-8-alpine as build
WORKDIR /usr/src/app

ONBUILD COPY pom.xml pom.xml
ONBUILD RUN mvn -B dependency:resolve
ONBUILD RUN mvn -B -e -q -C -T 1C dependency:go-offline
ONBUILD COPY src ./src
ONBUILD RUN mvn -B -e -q -o package