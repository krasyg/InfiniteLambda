#!/bin/bash

grep '#' /etc/services | grep -i debug /etc/services | awk '{print $1 " " $2 }' | cut -f1 -d"/" | awk '{print $2 " "$1}' > /tmp/udp.debug

sort -ru /tmp/udp.debug | head -2 > /tmp/udp.high

