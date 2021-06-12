#/bin/sh

PROCS="mysqld telegraf"
for PROC in $PROCS; do
	! pgrep $PROC && exit 1
done
exit 0
