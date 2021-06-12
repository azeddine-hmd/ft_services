#!/bin/sh

# telegraf
mkdir /etc/telegraf
cp telegraf.conf /etc/telegraf/telegraf.conf
telegraf &

# phpmyadmin
mkdir www
cp -r phpMyAdmin-5.0.4-english/* www
cp config.inc.php www/config.inc.php

# nginx
mv nginx.conf /etc/nginx

# services
openrc default
rc-service php-fpm7 start
rc-service nginx start

tail -f /dev/null
