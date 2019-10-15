echo "Building images..."
docker build -t sourcegroove/springboot-jdk-8-build springboot-jdk-8-build
docker build -t sourcegroove/springboot-jdk-8 springboot-jdk-8
docker build -t sourcegroove/angular-8-build angular-8-build
docker build -t sourcegroove/angular-8 angular-8
docker build -t sourcegroove/laravel-php-7 laravel-php-7
#docker build -t sourcegroove/jenkins-blueocean-1.19 jenkins-blueocean-1.19
#docker build -t sourcegroove/jenkins-docker-slave jenkins-docker-slave