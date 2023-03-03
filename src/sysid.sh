#!/bin/bash
SERIAL="$(dmidecode -s system-serial-number 2>/dev/null)"
test -z "$SERIAL" && SERIAL="$(cat /proc/cpuinfo | grep Serial | cut -d ' ' -f 2 2>/dev/null)"
test -n "$SERIAL" && SERIAL="$(echo $SERIAL | md5sum | awk '{print $1}' | cut -c1-5)"
echo "$SERIAL"
