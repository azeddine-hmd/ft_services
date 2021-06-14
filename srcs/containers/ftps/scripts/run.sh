#/bin/sh

# ftps
cp vsftpd.conf /etc/vsftpd
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=MA/ST=rhamna/L=Bengruir/O=1337/CN=vsftpd' -keyout /etc/vsftpd/vsftpd.key -out /etc/vsftpd/vsftpd.crt
adduser admin -D && echo "admin:admin" | chpasswd

# services
openrc default
rc-service vsftpd start

# telegraf
mkdir /etc/telegraf
cp telegraf.conf /etc/telegraf/telegraf.conf
telegraf &

tail -f /dev/null
