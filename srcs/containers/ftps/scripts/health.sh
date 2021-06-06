#/bin/sh

PROCS="vsftpd"
for PROC in $PROCS; do
	! pgrep "$PROC" && exit 1
done
exit 0
