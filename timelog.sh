#!/bin/sh

logfile="/tmp/timelog.log"
time_format="+%Y/%m/%d %H:%M:%S"

timelog() {
    _time=$(/bin/date "${time_format}" | sed -e 's/\r//g')
    if [ "$1" = "-n" ]; then
        echo -n "${_time} $2" >> ${logfile}
    else
        echo "${_time} $1" >> ${logfile}
    fi
}

# test
rm -f ${logfile}

timelog "one-line timelog with a newline..."
timelog ""

timelog -n "one-line timelog without a newline; "
echo "useful when handling some atomic procedure." >> ${logfile}
