FROM alpine:3.11
EXPOSE 8086


RUN apk update \
&& apk add bash \
&& apk add wget \
&& apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache \
&& apk add vim \
&& apk add nginx \
&& apk add openrc \
&& apk add influxdb libc6-compat

RUN openrc default \
&& echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
&& apk update && apk upgrade \
&& apk --no-cache add influxdb

# run
COPY scripts/* /
COPY config/* /
RUN chmod +x *.sh
VOLUME ['/sys/fs/cgroup']
CMD ["sh", "run.sh"]
