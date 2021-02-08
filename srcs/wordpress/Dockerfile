FROM alpine

EXPOSE 5050

RUN apk update \
&& apk add wget \
&& apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl \
php7-mbstring php7-json php7-session \
&& apk add nginx \
&& apk add vim

# wordpress setup
RUN wget https://wordpress.org/latest.tar.gz \
&& tar -xvf latest.tar.gz \
&& mkdir www \
&& mv wordpress/* www

# nginx setup
COPY config/nginx.conf /etc/nginx
RUN mkdir /run/nginx

# run
COPY scripts/services.sh /
RUN chmod u+x /services.sh
CMD ["sh", "services.sh"]
