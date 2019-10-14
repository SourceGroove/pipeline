echo "Building images..."
docker build -t images/sourcegroove/maven-3.6-jdk-8-onbuild maven-3.6-jdk-8
docker build -t images/sourcegroove/springboot-jdk-8-onbuild springboot-jdk-8

echo "Pusing images..."
docker push sourcegroove/maven-3.6-jdk-8-onbuild
docker push sourcegroove/springboot-jdk-8-onbuild
