FROM openjdk:8-jdk-alpine
ENV JAVA_OPTS=""
RUN ln -s /var/run/secrets /config
EXPOSE 80
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Duser.timezone=EST -Djava.security.edg=file:/dev/./urandom -Dserver.port=80 -jar /api.jar" ]

ONBUILD COPY --from=build /usr/src/app/target/api.jar /api.jar