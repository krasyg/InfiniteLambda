!#/bin/bash

find /var/log -name "*.log[0-9]*" -type f -mmin +240 -delete 

2>> /var/log/scr.log 
