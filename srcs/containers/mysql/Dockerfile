FROM alpine:3.11
EXPOSE 3306

RUN apk update \
&& apk add bash \
&& apk add wget \
&& apk add vim \
&& apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache \
&& apk add openrc --no-cache \
&& apk add mariadb mariadb-common mariadb-client

# Running service
COPY config/* /
COPY scripts/* /
RUN chmod +x *.sh
VOLUME ['/sys/fs/cgroup']
CMD ["sh", "run.sh"]
