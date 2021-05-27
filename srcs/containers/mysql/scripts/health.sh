#/bin/sh

# mariadb
if ! pgrep maraidb > /dev/null; then
	exit 1;
fi

# telegraf
if ! pgrep telegraf > /dev/null; then
	exit 1;
fi
