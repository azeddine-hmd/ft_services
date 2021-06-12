FROM alpine:3.11
EXPOSE 3000

RUN apk update \
&& apk add bash \
&& apk add wget \
&& apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache \
&& apk add libc6-compat

RUN wget https://dl.grafana.com/enterprise/release/grafana-enterprise-7.4.5.linux-amd64.tar.gz \
&& tar -zxvf grafana-enterprise-7.4.5.linux-amd64.tar.gz

# run
COPY scripts/* /
COPY config/* /
RUN chmod +x *.sh
CMD ["sh", "run.sh"]
