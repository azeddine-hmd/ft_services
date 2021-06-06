FROM alpine:3.12
EXPOSE 21
COPY scripts/* /
COPY config/* /
RUN chmod +x *.sh

RUN apk update \
&& apk add bash \
&& apk add wget \
&& apk add openrc \
&& apk add vim \
&& apk add vsftpd openssl

# run
CMD ["sh", "run.sh"]
