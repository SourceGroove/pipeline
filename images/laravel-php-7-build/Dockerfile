FROM php:7.2-apache-stretch as build

ENV PHP_OPCACHE_VALIDATE_TIMESTAMPS=1 \
	PHP_OPCACHE_MAX_ACCELERATED_FILES=8000 \
	PHP_OPCACHE_MEMORY_CONSUMPTION=128 

# basic php stuff...
RUN apt-get update && apt-get install -y openssl zip unzip libpng-dev mysql-server git gnupg gnupg2 apt-transport-https ghostscript \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && a2enmod rewrite \
    && a2enmod status \
	&& docker-php-ext-install opcache \
	&& pecl install redis xdebug \
	&& docker-php-ext-enable redis xdebug \
	&& composer global require hirak/prestissimo     

# SqlServer driver for php
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
	&& curl https://packages.microsoft.com/config/debian/9/prod.list > /etc/apt/sources.list.d/mssql-release.list \
	&& apt-get update \
	&& ACCEPT_EULA=Y apt-get install -y msodbcsql17 \
    && ACCEPT_EULA=Y apt-get install -y mssql-tools \
	&& apt-get install -y unixodbc-dev \
    && pecl install sqlsrv-5.5.0preview \
    && pecl install pdo_sqlsrv-5.5.0preview \
	&& echo extension=pdo_sqlsrv.so >> `php --ini | grep "Scan for additional .ini files" | sed -e "s|.*:\s*||"`/30-pdo_sqlsrv.ini \
	&& echo extension=sqlsrv.so >> `php --ini | grep "Scan for additional .ini files" | sed -e "s|.*:\s*||"`/20-sqlsrv.ini

# change apache doc root for laravel
ENV APACHE_DOCUMENT_ROOT=/var/www/html/public
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

#Laravel startup script since we're overriding stuff
COPY start.sh /usr/local/bin/start
RUN chmod +x /usr/local/bin/start