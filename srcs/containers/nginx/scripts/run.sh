#/bin/sh

# nginx configuration
mkdir /www
mv index.html www
mv nginx.conf /etc/nginx
mkdir /etc/nginx/ssl
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=MA/ST=rhamna/L=Bengruir/O=1337/CN=localhost' -keyout /etc/nginx/ssl/localhost.key -out /etc/nginx/ssl/localhost.crt

# services
openrc default
rc-service nginx start
rc-service sshd start

# telegraf
mkdir /etc/telegraf
cp telegraf.conf /etc/telegraf/telegraf.conf
telegraf &

tail -f /dev/null
