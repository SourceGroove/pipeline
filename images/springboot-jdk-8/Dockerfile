# Build container
FROM maven:3.6-jdk-8-alpine as build
WORKDIR /usr/src/app

COPY pom.xml pom.xml
RUN mvn -B dependency:resolve
RUN mvn -B -e -q -C -T 1C dependency:go-offline
COPY src ./src
RUN mvn -B -e -q -o package

# Deployment container
FROM openjdk:8-jdk-alpine
ENV JAVA_OPTS=""
RUN ln -s /var/run/secrets /config
EXPOSE 80
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.edg=file:/dev/./urandom -Dserver.port=80 -jar /api.jar" ]

COPY --from=build /usr/src/app/target/api.jar /api.jar