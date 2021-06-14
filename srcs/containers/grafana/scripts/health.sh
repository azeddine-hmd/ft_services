#/bin/sh

PROCS="grafana"
for PROC in $PROCS; do
	! pgrep "$PROC" && exit 1
done
exit 0
