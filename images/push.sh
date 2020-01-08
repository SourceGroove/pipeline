export IMAGE_VERSION=1.0.1

docker login -u sourcegroove 

echo "Pushing images ${IMAGE_VERSION} & latest..."
docker tag sourcegroove/springboot-jdk-8-build sourcegroove/springboot-jdk-8-build:${IMAGE_VERSION}
docker push sourcegroove/springboot-jdk-8-build:${IMAGE_VERSION}
docker push sourcegroove/springboot-jdk-8-build

docker tag sourcegroove/springboot-jdk-8 sourcegroove/springboot-jdk-8:${IMAGE_VERSION}
docker push sourcegroove/springboot-jdk-8:${IMAGE_VERSION}
docker push sourcegroove/springboot-jdk-8

docker tag sourcegroove/angular-8-build sourcegroove/angular-8-build:${IMAGE_VERSION}
docker push sourcegroove/angular-8-build:${IMAGE_VERSION}
docker push sourcegroove/angular-8-build

docker tag sourcegroove/angular-8 sourcegroove/angular-8:${IMAGE_VERSION}
docker push sourcegroove/angular-8:${IMAGE_VERSION}
docker push sourcegroove/angular-8

docker tag sourcegroove/laravel-php-7 sourcegroove/laravel-php-7:${IMAGE_VERSION}
docker push sourcegroove/laravel-php-7:${IMAGE_VERSION}
docker push sourcegroove/laravel-php-7

