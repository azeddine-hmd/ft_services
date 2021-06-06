FROM alpine:3.11

RUN apk update \
&& apk add bash \
&& apk add wget \
&& apk add vim \
&& apk add nginx \
&& apk add openrc \
&& apk add influxdb libc6-compat

# telegraf
ENV TELEGRAF_V 1.18.0
ADD https://dl.influxdata.com/telegraf/releases/telegraf-${TELEGRAF_V}_linux_amd64.tar.gz ./
RUN tar xf telegraf-${TELEGRAF_V}_linux_amd64.tar.gz && \
        chmod +x telegraf-1.18.0/* && \
        cp /telegraf-1.18.0/usr/bin/telegraf /usr/bin/ && \
        rm -rf *.tar.gz* telegraf-1.18.0/


# run
EXPOSE 8086
COPY scripts/* /
COPY config/* /
RUN chmod +x *.sh
CMD ["sh", "run.sh"]
