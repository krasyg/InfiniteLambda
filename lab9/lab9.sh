#!/usr/bin/env bash

rand_num_1=$((RANDOM%10+1))
rand_num_2=$((RANDOM%10+1))
rand_num_3=$((RANDOM%10+1))
echo $rand_num_1
echo $rand_num_2
echo $rand_num_3


# ps_num=$(($(ps aux | grep 'ps aux$' | awk '{ print $2}') /100))
ps_num=5

for i in `seq 1 $rand_num_1`
    do
    mkdir $i.directory/
        for j in `seq 1 $rand_num_2`
            do
            mkdir $i.directory/$j.dir
                for k in `seq 1 $rand_num_3`
                    do
                    mkdir $i.directory/$j.dir/$k.direct
                        for p in `seq 1 $ps_num`
                        do
                        touch $i.directory/$j.dir/$k.direct/$p.file
                        done
                    done
            done
    done

