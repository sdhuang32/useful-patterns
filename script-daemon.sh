#!/bin/bash
# reference: https://stackoverflow.com/questions/185451/quick-and-dirty-way-to-ensure-only-one-instance-of-a-shell-script-is-running-at
# if you need a long-term job but probably periodically check-and-restart-if-not-run by crond, you need this to avoid second execution.

PID_FILE="/var/run/script-daemon.pid"
if [ -f ${PID_FILE} ] && kill -0 "$(cat ${PID_FILE})"; then
    echo "pid file exists and process is running, no need to execute again."
    exit 0
fi

echo "$$" > ${PID_FILE}
trap "rm -f ${PID_FILE}; exit 0" INT TERM EXIT

# do the stuff
while true; do
    sleep 1
done

# never reach here when doing infinite loop jobs,
# but necessary on normal jobs.
rm -f ${PID_FILE}
