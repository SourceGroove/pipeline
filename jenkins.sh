#tear down
docker stack rm jenkins
docker secret rm jenkins-user
docker secret rm jenkins-pass
#docker volume rm jenkins_jenkins-data

sleep 10

#up
docker volume create jenkins-data
echo "admin" | docker secret create jenkins-user -
echo "admin" | docker secret create jenkins-pass -
docker stack deploy -c jenkins.yml jenkins
