#!/usr/bin/env bash

df -h | sed '1d' | awk '{print $6 "  " $5}' | sed 's/.$//' > file


while read -r file;
do
    mountpoint=$(echo $file | cut -d " " -f1)
    usege=$(echo $file | cut -d " " -f2)

    if [ $usege -ge 0 ] && [ $usege -le 20 ]
    then
        echo $mountpoint Low
    elif [ $usege -ge 21 ] && [ $usege -le 40 ]
    then
        echo $mountpoint Average
    elif [ $usege -ge 41 ] && [ $usege -le 60 ]
    then
        echo $mountpoint High
    elif [ $usege -ge 91 ] && [ $usege -le 90 ]
    then
        echo $mountpoint Warning
    elif [ $usege -gt 90 ]
    then
        echo $mountpoint Danger
    fi 

done < file
