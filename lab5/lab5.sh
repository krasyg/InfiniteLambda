#!/usr/bin/env bash

counter=0

while [ $counter -lt 10 ]; do
    dd if=/dev/random of=10MB-$(date +%M-%S).file bs=10MB count=1
    sleep 2
    counter=$(($counter + 1))
done


for f in 10MB-*.file; do

    seconds=$(echo $f | cut -d'-' -f 3 | cut -d'.' -f 1)
    if [[ $(( seconds % 2 )) -eq 0 ]]; then
        rm $f
    fi    
done



