#/bin/sh

PROCS="nginx sshd telegraf"
for PROC in $PROCS; do
	! pgrep $PROC && exit 1
done
exit 0
