echo "Building images..."
docker build -t sourcegroove/springboot-jdk-8-build images/springboot-jdk-8-build
docker build -t sourcegroove/springboot-jdk-8 images/springboot-jdk-8
docker build -t sourcegroove/angular-8-build images/angular-8-build
docker build -t sourcegroove/angular-8 images/angular-8
docker build -t sourcegroove/laravel-php-7-build images/laravel-php-7-build
docker build -t sourcegroove/laravel-php-7 images/laravel-php-7

echo "Pusing images..."
docker push sourcegroove/springboot-jdk-8-build
docker push sourcegroove/springboot-jdk-8
docker push sourcegroove/angular-8-build
docker push sourcegroove/angular-8
docker push sourcegroove/laravel-php-7-build
docker push sourcegroove/laravel-php-7