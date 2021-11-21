#!/bin/bash

grep -i '#.*debug' /etc/services | awk '{print $1 " " $2 }' | cut -f1 -d"/" | awk '{print $2 " "$1}' > /tmp/udp.debug

sort -run /tmp/udp.debug | head -2 > /tmp/udp.high

