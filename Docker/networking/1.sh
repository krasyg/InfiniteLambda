#!/usr/bin/env bash

# create two bridge networks
docker network create net1
docker network create net2

# create three alpine containers
for i in $(seq 1 3) 
do
    echo $(docker run -itd --name alpine$i alpine)
done

# connect alpine1 and alpine2 to net1, alpine2 and alpine3 to net2
for i in $(seq 1 2) 
do
    echo $(docker network connect net1 alpine$i)
done

for j in $(seq 2 3) 
do
    echo $(docker network connect net2 alpine$j)
done


for i in $(seq 1 3) 
do
    for j in $(seq 1 3) 
    do 
        if [[ $i -eq $j ]]
        then
            continue
        else
            echo $(docker exec alpine$i ping -c 1 alpine$j)
        fi
    done
    
done
