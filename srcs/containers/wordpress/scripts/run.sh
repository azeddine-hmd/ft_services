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

tail -f /dev/null
