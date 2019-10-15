echo "Tearing down existing..."
docker stack rm jenkins
docker secret rm jenkins-user
docker secret rm jenkins-pass
#docker volume rm jenkins_jenkins-data

echo "Building containers..."
docker build -t sourcegroove/jenkins-blueocean-1.19 images/jenkins-blueocean-1.19

sleep 5

echo "Deploying new..."
docker volume create jenkins-data
echo "admin" | docker secret create jenkins-user -
echo "admin" | docker secret create jenkins-pass -
docker stack deploy -c stacks/jenkins.yml jenkins
