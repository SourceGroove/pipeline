docker stack rm jenkins
#docker secret rm jenkins-user
#docker secret rm jenkins-pass
#docker volume rm jenkins_jenkins-data

docker build -t madena/jenkins images/master
docker build -t madena/jenkins-slave images/slave

#docker volume create jenkins-data
#echo "admin" | docker secret create jenkins-user -
#echo "admin" | docker secret create jenkins-pass -

docker stack deploy -c jenkins.yml jenkins
