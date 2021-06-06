#/bin/sh

SLEEP_TIME=60

# more matsawbat
openrc default
cp mariadb-server.cnf /etc/my.cnf.d
rc-update add mariadb default
/etc/init.d/mariadb setup
mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mys

# mariadb
chown -R mysql:mysql /var/lib/mysql
rc-service mariadb start
mariadb -u root -e "CREATE USER  'pma'@'localhost' IDENTIFIED BY 'pmapass';"
mariadb -u root -e "GRANT ALL ON *.* to 'pma'@'%' IDENTIFIED BY 'pmapass' WITH GRANT OPTION;"
mariadb -u root < pma_tables.sql
echo "CREATE DATABASE wp_db;" | mysql -u root
echo "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' IDENTIFIED BY 'admin';" | mysql -u root
echo "GRANT ALL PRIVILEGES ON wp_db.* TO 'admin'@'%' IDENTIFIED BY 'admin';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
mariadb -u root < wp_db.sql


tail -f /dev/null
