FROM alpine:3.11
EXPOSE 5000
COPY config/* /
COPY scripts/* /
RUN chmod +x *.sh

RUN apk update \
&& apk add bash \
&& apk add wget \
&& apk add vim \
&& apk add openrc \
&& apk add nginx \
&& apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl \
php7-mbstring php7-json php7-session

# phpmyadmin
RUN wget https://files.phpmyadmin.net\
/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-english.tar.gz \
&& tar -xvf phpMyAdmin-5.0.4-english.tar.gz

# run
CMD ["sh", "run.sh"]
