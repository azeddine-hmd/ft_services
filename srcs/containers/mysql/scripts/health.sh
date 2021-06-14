#/bin/sh

PROCS="mysqld"
for PROC in $PROCS; do
	! pgrep $PROC && exit 1
done
exit 0
