FROM alpine:3.11
EXPOSE 80 443
COPY scripts/* /
COPY config/* /

RUN apk update \
&& apk add openrc \
&& apk add bash \
&& apk add wget \
&& apk add vim \
&& apk add nginx \
&& apk add openrc \
&& apk add openssh openssl

# ssh
RUN adduser -D user \
&& echo "user:password" | chpasswd \
&& ssh-keygen -A


RUN chmod +x *.sh
CMD ["sh", "run.sh"]
