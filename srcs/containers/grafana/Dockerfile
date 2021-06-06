FROM alpine:3.11
EXPOSE 3000

RUN wget https://dl.grafana.com/enterprise/release/grafana-enterprise-7.4.5.linux-amd64.tar.gz \
&& tar -xvf grafana-enterprise-7.4.5.linux-amd64.tar.gz

RUN apk update \
&& apk add bash \
&& apk add wget \
&& apk add vim \
&& apk add nginx \
&& apk add openrc \
&& apk add libc6-compat

# run
COPY scripts/* /
COPY config/* /
RUN chmod +x *.sh
CMD ["sh", "run.sh"]
