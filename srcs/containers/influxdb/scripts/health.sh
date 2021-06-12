#/bin/sh

PROCS="influxd telegraf"
for PROC in $PROCS; do
	! pgrep "$PROC" && exit 1
done
exit 0
