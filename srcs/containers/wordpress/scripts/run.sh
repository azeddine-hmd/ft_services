#!/bin/sh

# wordpress
mkdir www
mv wordpress/* www
mv wp-config.php www

# nginx
mv nginx.conf /etc/nginx

# services
openrc default
rc-service php-fpm7 start
rc-service nginx start

# telegraf
mkdir /etc/telegraf
cp telegraf.conf /etc/telegraf/telegraf.conf
telegraf &

tail -f /dev/null
