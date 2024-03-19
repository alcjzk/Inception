#!/bin/sh

apk update && apk upgrade
# Build dependencies
apk add wget php82 php82-phar php82-iconv
# Runtime dependencies
apk add php82-fpm php82-mysqli

mv fpm.ini /etc/php82/php-fpm.d/fpm.conf
mv www.conf.ini /etc/php82/php-fpm.d/www.conf
mv php.ini /etc/php82/

# wp-cli
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

