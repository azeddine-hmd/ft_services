FROM alpine:3.11
EXPOSE 3306

RUN apk update \
&& apk add bash \
&& apk add wget \
&& apk add vim \
&& apk add openrc --no-cache \
&& apk add mariadb mariadb-common mariadb-client

# Copy configuration files into container
COPY config/* /

# mariadb setup and installation
#RUN openrc default \
#&& cp mariadb-server.cnf /etc/my.cnf.d \
#&& rc-update add mariadb default \
#&& /etc/init.d/mariadb setup \
#&& mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

# Running service
COPY scripts/* /
RUN chmod +x *.sh
CMD ["sh", "run.sh"]
