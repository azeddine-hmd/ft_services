#!/bin/sh

# external IP
IP=$(cat /ip.txt)

php-fpm7
nginx
