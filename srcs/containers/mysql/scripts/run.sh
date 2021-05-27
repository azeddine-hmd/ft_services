#/bin/sh

SLEEP_TIME=60

chown -R mysql:mysql /var/lib/mysql
rc-service mariadb start
mariadb -u root -e "CREATE USER  'pma'@'localhost' IDENTIFIED BY 'pmapass';"
mariadb -u root -e "GRANT ALL ON *.* to 'pma'@'%' IDENTIFIED BY 'pmapass' WITH GRANT OPTION;"
mariadb -u root < pma_tables.sql
mariadb -u root -e "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;"
mariadb -u root -e "GRANT ALL ON wordpress.* TO 'sara'@'%' IDENTIFIED BY 'azerty';"
mariadb -u root -e "FLUSH PRIVILEGES;"

sleep 1111111111111
