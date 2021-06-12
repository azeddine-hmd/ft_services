FROM alpine:3.12
EXPOSE 21

RUN apk update \
&& apk add bash \
&& apk add wget \
&& apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache \
&& apk add openrc \
&& apk add vim \
&& apk add vsftpd openssl

# run
COPY scripts/* /
COPY config/* /
RUN chmod +x *.sh
CMD ["sh", "run.sh"]
