#!/bin/sh

# phpmyadmin
mkdir www
mv phpMyAdmin-5.0.4-english/* www
mv config.inc.php www

# nginx
mv nginx.conf /etc/nginx

# services
openrc default
rc-service php-fpm7 start
rc-service nginx start

tail -f /dev/null
