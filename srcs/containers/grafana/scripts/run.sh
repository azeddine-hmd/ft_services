#/bin/sh

# launch grafana
cp grafana.db grafana-7.4.5/data/grafana.db
cd grafana-7.4.5/bin && ./grafana-server &
cd /

# telegraf
mkdir /etc/telegraf
cp telegraf.conf /etc/telegraf/telegraf.conf
telegraf &

tail -f /dev/null
