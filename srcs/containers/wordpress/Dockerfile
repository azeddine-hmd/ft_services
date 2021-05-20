FROM alpine
ARG IP

RUN apk update \
&& apk add wget \
&& apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl \
php7-mbstring php7-json php7-session \
&& apk add nginx \
&& apk add vim
RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

# wordpress setup
RUN wget https://wordpress.org/latest.tar.gz \
&& tar -xvf latest.tar.gz \
&& mkdir www \
&& mv wordpress/* www

# nginx setup
COPY config/nginx.conf /etc/nginx
RUN mkdir /run/nginx

# LivenessProbe
COPY scripts/health.sh /
RUN chmod +x health.sh

# run
COPY scripts/services.sh /
RUN chmod u+x /services.sh
CMD ["sh", "services.sh"]
