echo "Building images..."
docker build -t sourcegroove/springboot-jdk-8-build images/springboot-jdk-8-build
docker build -t sourcegroove/springboot-jdk-8-onbuild images/springboot-jdk-8
docker build -t sourcegroove/angular-8-build images/angular-8-build
docker build -t sourcegroove/angular-8-onbuild images/angular-8
docker build -t sourcegroove/laravel-php-7-onbuild images/laravel-php-7

echo "Pusing images..."
docker push sourcegroove/springboot-jdk-8-build
docker push sourcegroove/springboot-jdk-8-onbuild
docker push sourcegroove/angular-8-build
docker push sourcegroove/angular-8-onbuild
docker push sourcegroove/laravel-php-7