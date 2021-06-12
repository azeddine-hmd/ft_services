FROM alpine:3.11
EXPOSE 80 443

RUN apk update \
&& apk add openrc \
&& apk add bash \
&& apk add wget \
&& apk add vim \
&& apk add nginx \
&& apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache \
&& apk add openrc \
&& apk add openssh openssl

# ssh
RUN adduser -D user \
&& echo "user:password" | chpasswd \
&& ssh-keygen -A

# run
COPY scripts/* /
COPY config/* /
RUN chmod +x *.sh
CMD ["sh", "run.sh"]
