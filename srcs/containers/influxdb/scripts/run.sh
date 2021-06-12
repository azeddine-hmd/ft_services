#/bin/sh

# telegraf
mkdir /etc/telegraf
cp telegraf.conf /etc/telegraf/telegraf.conf
telegraf &

# influxdb
cp influxdb.conf /etc/influxdb.conf
openrc default
rc-update add influxdb default
rc-service influxdb start

tail -f /dev/null
