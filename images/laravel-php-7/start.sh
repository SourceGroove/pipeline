#!/usr/bin/env bash

set -e

export APACHE_AUTH_REQUIRE="all granted"

if [ "$env" != "local" ]; then
	echo "Caching configuration"
	(
		cd /var/www/html &&
			php artisan config:cache &&
			php artisan route:cache &&
			php artisan view:cache 
	)
	echo "Removing XDebug"
	rm -rf /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

	echo "Enabling OPCACHE no refresh"
	export PHP_OPCACHE_VALIDATE_TIMESTAMPS=0

fi

exec apache2-foreground