#/bin/sh

PROCS="nginx php-fpm"
for PROC in $PROCS; do
	! pgrep "$PROC" && exit 1
done
exit 0
