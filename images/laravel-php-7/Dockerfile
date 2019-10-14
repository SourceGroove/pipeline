FROM php:7.2-apache-stretch

WORKDIR /var/www/html/

RUN chgrp -R www-data . \
  && chmod -R 775 . \
  && ln -s /var/run/secrets/.env .env 

#Laravel stuff needed to get composer install to fully execute
ONBUILD COPY artisan composer.json composer.lock package.json package-lock.json server.php gulpfile.js webpack.mix.js setup.sh ./
ONBUILD COPY storage ./storage
ONBUILD COPY bootstrap ./bootstrap 
ONBUILD COPY database ./database
ONBUILD COPY thirdparty ./thirdparty
ONBUILD COPY config ./config
ONBUILD COPY routes ./routes
ONBUILD COPY app/Console ./app/Console 
ONBUILD COPY app/Exceptions ./app/Exceptions
ONBUILD COPY app/Providers ./app/Providers
ONBUILD COPY app/Api.php app/User.php ./app/
ONBUILD RUN composer install --no-dev -o

#Copying the stuff likely to change so we can leverage cache above
#COPY opcache.ini /usr/local/etc/php/conf.d/opcache.ini
ONBUILD COPY public ./public
ONBUILD COPY resources ./resources
ONBUILD COPY app/Http ./app/Http 

EXPOSE 80
CMD ["/usr/local/bin/start"]