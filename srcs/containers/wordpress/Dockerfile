FROM alpine:3.11
EXPOSE 5050
COPY scripts/* /
COPY config/* /
RUN chmod +x *.sh

RUN apk update \
&& apk add bash \
&& apk add wget \
&& apk add vim \
&& apk add nginx \
&& apk add openrc \
&& apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl \
php7-mbstring php7-json php7-session

# wordpress
RUN wget https://wordpress.org/latest.tar.gz \
&& tar -xvf latest.tar.gz

# run
CMD ["sh", "run.sh"]
