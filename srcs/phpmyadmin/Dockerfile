FROM alpine

EXPOSE 5000

RUN apk update \
&& apk add wget \
&& apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl \
php7-mbstring php7-json php7-session \
&& apk add nginx \
&& apk add vim

# phpmyadmin
RUN wget https://files.phpmyadmin.net\
/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-english.tar.gz \
&& tar -xvf phpMyAdmin-5.0.4-english.tar.gz \
&& mkdir www \
&& mv phpMyAdmin-5.0.4-english/* /www

# nginx setup
COPY config/nginx.conf /etc/nginx
RUN mkdir /run/nginx

# run
COPY scripts/services.sh /
RUN chmod u+x /services.sh
CMD ["sh", "services.sh"]
